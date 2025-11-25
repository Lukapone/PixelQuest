//! PixelQuest - Core game logic module
const std = @import("std");

// Re-export window module
pub const Window = @import("window.zig").Window;

pub fn gameLoop(window: *Window) !void {
    std.debug.print("Starting game loop with window...\n", .{});
    std.debug.print("Window size: {d}x{d}\n", .{ window.width, window.height });
    std.debug.print("Press window close button or Ctrl+C to exit\n", .{});

    // Main game loop
    var frame_count: u32 = 0;
    while (!window.shouldClose()) {
        // Poll for window events
        Window.pollEvents();

        // Simple frame counter for demonstration
        frame_count += 1;
        if (frame_count % 60 == 0) { // Print every 60 frames (~1 second at 60 FPS)
            const size = window.getFramebufferSize();
            std.debug.print("Frame {d}: Window {d}x{d}\n", .{ frame_count, size.width, size.height });
        }

        // TODO: Add game logic and rendering here
    }

    std.debug.print("Game loop ended. Window closed.\n", .{});
}

pub fn add(a: i32, b: i32) i32 {
    return a + b;
}

test "basic add functionality" {
    try std.testing.expect(add(3, 7) == 10);
}
