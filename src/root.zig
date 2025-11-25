//! PixelQuest - Core game logic module
const std = @import("std");
const glfw = @import("thirdparty/glfw/src/main.zig");

// Re-export window module
// pub const Window = @import("window.zig").Window;
/// Default GLFW error handling callback
fn errorCallback(error_code: glfw.ErrorCode, description: [:0]const u8) void {
    std.log.err("glfw: {}: {s}\n", .{ error_code, description });
}

pub fn gameLoop() !void {
    std.debug.print("Starting game loop with window...\n", .{});
    // std.debug.print("Window size: {d}x{d}\n", .{ window.width, window.height });
    std.debug.print("Press window close button or Ctrl+C to exit\n", .{});

    // // Main game loop
    // var frame_count: u32 = 0;
    // while (!window.shouldClose()) {
    //     // Poll for window events
    //     Window.pollEvents();

    //     // Simple frame counter for demonstration
    //     frame_count += 1;
    //     if (frame_count % 1000000 == 0) { // Print every 60 frames (~1 second at 60 FPS)
    //         const size = window.getFramebufferSize();
    //         std.debug.print("Frame {d}: Window {d}x{d}\n", .{ frame_count, size.width, size.height });
    //     }

    //     // TODO: Add game logic and rendering here
    // }

    glfw.setErrorCallback(errorCallback);
    if (!glfw.init(.{})) {
        std.log.err("failed to initialize GLFW: {?s}", .{glfw.getErrorString()});
        return error.GlfwInitFailed;
    }
    defer glfw.terminate();

    // Create our window
    const window = glfw.Window.create(640, 480, "Hello, zig-glfw!", null, null, .{}) orelse {
        std.log.err("failed to create GLFW window: {?s}", .{glfw.getErrorString()});
        return error.WindowCreationFailed;
    };
    defer window.destroy();

    // Wait for the user to close the window.
    while (!window.shouldClose()) {
        window.swapBuffers();

        // Render your graphics here

        glfw.pollEvents();
    }

    std.debug.print("Game loop ended. Window closed.\n", .{});
}

