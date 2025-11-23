const std = @import("std");
const PixelQuest = @import("PixelQuest");

pub fn main() !void {
    std.debug.print("Welcome to PixelQuest! 🎮\n", .{});
    std.debug.print("A Zig-based game learning project\n", .{});

    try PixelQuest.gameLoop();
}

test "game initialization test" {
    const gpa = std.testing.allocator;
    var game_state = GameState{};
    defer game_state.deinit(gpa);

    try game_state.init(gpa);
    try std.testing.expect(game_state.is_initialized);
}

const GameState = struct {
    is_initialized: bool = false,
    player_x: i32 = 0,
    player_y: i32 = 0,

    pub fn init(self: *GameState, allocator: std.mem.Allocator) !void {
        _ = allocator;
        self.is_initialized = true;
        self.player_x = 100;
        self.player_y = 100;
    }

    pub fn deinit(self: *GameState, allocator: std.mem.Allocator) void {
        _ = allocator;
        self.is_initialized = false;
    }
};
