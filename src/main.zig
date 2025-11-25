const std = @import("std");
const PixelQuest = @import("PixelQuest");

pub fn main() !void {
    std.debug.print("Welcome to PixelQuest! 🎮\n", .{});
    std.debug.print("A Zig-based game learning project\n", .{});

    // Initialize GLFW
    try PixelQuest.Window.init();
    defer PixelQuest.Window.deinit();

    // Create window
    var window = try PixelQuest.Window.create(800, 600, "PixelQuest");
    defer window.destroy();

    // Run game loop with window
    try PixelQuest.gameLoop(&window);
}
