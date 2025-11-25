const std = @import("std");
const PixelQuest = @import("PixelQuest");

pub fn main() !void {
    std.debug.print("Welcome to PixelQuest! 🎮\n", .{});
    std.debug.print("A Zig-based game learning project\n", .{});

    try PixelQuest.gameLoop();
}
