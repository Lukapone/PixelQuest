const std = @import("std");
const PixelQuest = @import("PixelQuest");

pub const std_options = PixelQuest.logging.std_options;
const log = std.log.scoped(.main);

pub fn main() !void {
    log.info("Starting PixelQuest!", .{});
    try PixelQuest.main();
}
