// Zig build system documentation: https://ziglang.org/learn/build-system/
const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const use_zig_shaders = b.option(bool, "zig-shaders", "Use Zig shaders instead of GLSL") orelse false;

    // Vulkan dependency
    const vulkan = b.dependency("vulkan", .{
        .registry = b.dependency("vulkan_headers", .{}).path("registry/vk.xml"),
    }).module("vulkan-zig");

    const mod = b.addModule("PixelQuest", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .imports = &.{
            .{ .name = "vulkan", .module = vulkan },
        },
    });

    // mod.addImport("vulkan", vulkan);

    const exe = b.addExecutable(.{
        .name = "PixelQuest",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            .optimize = optimize,
            .link_libc = true,
            .imports = &.{
                .{ .name = "PixelQuest", .module = mod },
                .{ .name = "vulkan", .module = vulkan },
            },
        }),
    });

    exe.linkSystemLibrary("glfw");
    exe.linkSystemLibrary("vulkan");

    // Shader compilation
    if (use_zig_shaders) {
        const spirv_target = b.resolveTargetQuery(.{
            .cpu_arch = .spirv32,
            .os_tag = .vulkan,
            .cpu_model = .{ .explicit = &std.Target.spirv.cpu.vulkan_v1_2 },
            .ofmt = .spirv,
        });

        const vert_spv = b.addObject(.{
            .name = "vertex_shader",
            .root_module = b.createModule(.{
                .root_source_file = b.path("src/shaders/vertex.zig"),
                .target = spirv_target,
            }),
            .use_llvm = false,
        });
        mod.addAnonymousImport(
            "vertex_shader",
            .{ .root_source_file = vert_spv.getEmittedBin() },
        );

        const frag_spv = b.addObject(.{
            .name = "fragment_shader",
            .root_module = b.createModule(.{
                .root_source_file = b.path("src/shaders/fragment.zig"),
                .target = spirv_target,
            }),
            .use_llvm = false,
        });
        mod.addAnonymousImport(
            "fragment_shader",
            .{ .root_source_file = frag_spv.getEmittedBin() },
        );
    } else {
        const vert_cmd = b.addSystemCommand(&.{
            "glslc",
            "--target-env=vulkan1.2",
            "-o",
        });
        const vert_spv = vert_cmd.addOutputFileArg("vert.spv");
        vert_cmd.addFileArg(b.path("src/shaders/triangle.vert"));
        mod.addAnonymousImport("vertex_shader", .{
            .root_source_file = vert_spv,
        });

        const frag_cmd = b.addSystemCommand(&.{
            "glslc",
            "--target-env=vulkan1.2",
            "-o",
        });
        const frag_spv = frag_cmd.addOutputFileArg("frag.spv");
        frag_cmd.addFileArg(b.path("src/shaders/triangle.frag"));
        mod.addAnonymousImport("fragment_shader", .{
            .root_source_file = frag_spv,
        });
    }

    b.installArtifact(exe);
    const run_step = b.step("run", "Run the app");
    const run_cmd = b.addRunArtifact(exe);
    run_step.dependOn(&run_cmd.step);
    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const mod_tests = b.addTest(.{
        .root_module = mod,
    });
    const run_mod_tests = b.addRunArtifact(mod_tests);

    const exe_tests = b.addTest(.{
        .root_module = exe.root_module,
    });
    const run_exe_tests = b.addRunArtifact(exe_tests);

    // Default test step - only runs root module tests with summary
    const test_step = b.step("test-base", "Run core module tests");
    test_step.dependOn(&run_mod_tests.step);

    // Test with summary step - shows detailed output
    const test_summary_step = b.step("test", "Run core module tests with summary");
    const run_mod_tests_summary = b.addSystemCommand(&.{
        "zig",
        "build",
        "test-base",
        "--summary",
        "all",
    });
    test_summary_step.dependOn(&run_mod_tests_summary.step);

    // Additional test step for main module tests
    const test_main_step = b.step("test-main", "Run main module tests");
    test_main_step.dependOn(&run_exe_tests.step);

    // Clean step to remove build artifacts
    const clean_step = b.step("clean", "Remove build artifacts");
    const clean_cmd = b.addSystemCommand(&.{
        "rm",
        "-rf",
        ".zig-cache",
        "zig-out",
    });
    clean_step.dependOn(&clean_cmd.step);
}
