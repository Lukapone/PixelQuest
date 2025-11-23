//! PixelQuest - Core game logic module
const std = @import("std");

pub fn gameLoop() !void {
    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    try stdout.print("Starting game loop...\n", .{});
    try stdout.print("Press Ctrl+C to exit\n", .{});

    // Simple game loop placeholder
    var frame_count: u32 = 0;
    while (frame_count < 5) {
        try stdout.print("Frame {d}: Game running\n", .{frame_count});
        frame_count += 1;
    }

    try stdout.print("Game loop ended. Ready for implementation!\n", .{});
    try stdout.flush();
}

pub fn add(a: i32, b: i32) i32 {
    return a + b;
}

test "basic add functionality" {
    try std.testing.expect(add(3, 7) == 10);
}

test "game loop test" {
    // Test that gameLoop doesn't crash
    try gameLoop();
}
