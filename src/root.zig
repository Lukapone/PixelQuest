//! PixelQuest - Core game logic module
const std = @import("std");
const glfw = @import("thirdparty/glfw/src/main.zig");
//reexport for usage in main
pub const logging = @import("logging.zig");

const log = std.log.scoped(.game);
const log_window = std.log.scoped(.window);
const log_fps = std.log.scoped(.fps);

/// Default GLFW error handling callback
fn errorCallback(error_code: glfw.ErrorCode, description: [:0]const u8) void {
    log_window.err("glfw: {}: {s}", .{ error_code, description });
}

pub fn gameLoop() !void {
    // glfw.setErrorCallback(errorCallback);
    if (!glfw.init(.{})) {
        log_window.err("failed to initialize GLFW: {?s}", .{glfw.getErrorString()});
        return error.GlfwInitFailed;
    }
    defer glfw.terminate();

    // Create our window
    const window = glfw.Window.create(800, 600, "PixelQuest", null, null, .{}) orelse {
        log_window.err("failed to create GLFW window: {?s}", .{glfw.getErrorString()});
        return error.WindowCreationFailed;
    };
    defer window.destroy();

    log.info("Starting game loop with window...", .{});
    const size = window.getSize();
    log.info("Window size: {d}x{d}", .{ size.width, size.height });
    log.info("Press window close button or Ctrl+C to exit", .{});

    // FPS calculation variables
    var frame_count: u32 = 0;
    var total_frames: u32 = 0;
    var last_time = glfw.getTime();
    var fps_timer: f64 = 0.0;

    // Main game loop
    while (!window.shouldClose()) {
        const current_time = glfw.getTime();
        const delta_time = current_time - last_time;
        last_time = current_time;

        // Update FPS counter every second
        fps_timer += delta_time;
        if (fps_timer >= 1.0) {
            const fps = @as(f64, @floatFromInt(frame_count)) / fps_timer;
            log_fps.info("FPS: {d:.1} | Frame: {d} | Total: {d}", .{ fps, frame_count, total_frames });
            frame_count = 0;
            fps_timer = 0.0;
        }

        // Render your graphics here
        window.swapBuffers();

        // Poll for window events
        glfw.pollEvents();

        frame_count += 1;
        total_frames += 1;
    }

    log.info("Game loop ended. Window closed.", .{});
}
