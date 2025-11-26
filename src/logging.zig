const std = @import("std");

pub const want_custom_logfn = true;
//if we have std_options defined we override the default options
pub const std_options = std.Options{
    // Set the log level to info
    .log_level = .debug,
    // .log_level = .info,
    .log_scope_levels = &[_]std.log.ScopeLevel{
        .{ .scope = .main, .level = .debug },
        .{ .scope = .window, .level = .debug },
        .{ .scope = .game, .level = .info },
        .{ .scope = .fps, .level = .info },
    },
    .logFn = if (want_custom_logfn) customLog else std.log.defaultLog,
};

const TimeParts = packed struct {
    year: u12,
    month: u4, // 16
    day: u5,
    hour: u5,
    minute: u6, // 32
    second: u6,
    millisecond: u10, // 48

    /// Not applicable to time previous to epoch.
    ///
    /// Ported from: https://stackoverflow.com/a/11197532/12185226
    pub fn fromMsTimestamp(timestamp: u64) @This() {
        const ms = timestamp % 1000;

        // Re-bias from 1970 to 1601:
        // 1970 - 1601 = 369 = 3*100 + 17*4 + 1 years (incl. 89 leap days) =
        // (3*100*(365+24/100) + 17*4*(365+1/4) + 1*365)*24*3600 seconds
        var sec: u64 = (timestamp / 1000) + 11644473600;

        // Remove multiples of 400 years (incl. 97 leap days)
        const quadricentennials: u64 = sec / 12622780800; // 400*365.2425*24*3600
        sec %= 12622780800;

        // Remove multiples of 100 years (incl. 24 leap days), can't be more than 3
        // (because multiples of 4*100=400 years (incl. leap days) have been removed)
        const centennials: u64 = @min(3, sec / 3155673600); // 100*(365+24/100)*24*3600
        sec -= centennials * 3155673600;

        // Remove multiples of 4 years (incl. 1 leap day), can't be more than 24
        // (because multiples of 25*4=100 years (incl. leap days) have been removed)
        const quadrennials: u64 = @min(24, sec / 126230400); // 4*(365+1/4)*24*3600
        sec -= quadrennials * 126230400;

        // Remove multiples of years (incl. 0 leap days), can't be more than 3
        // (because multiples of 4 years (incl. leap days) have been removed)
        const annuals: u64 = @min(3, sec / 31536000); // 365*24*3600
        sec -= annuals * 31536000;

        const year = 1601 + quadricentennials * 400 + centennials * 100 + quadrennials * 4 + annuals;
        const leap = (year % 4 == 0) and (year % 100 != 0 or (year % 400 == 0));

        const yday = sec / 86400;
        sec %= 86400;

        const hour = sec / 3600;
        sec %= 3600;

        const minute = sec / 60;
        sec %= 60;

        const mday_list: [12]u9 = if (leap)
            .{ 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335, 366 }
        else
            .{ 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365 };
        const month = for (mday_list, 0..) |x, i| {
            if (yday < x) break i;
        } else unreachable;
        const mday = if (month == 0) yday else yday - mday_list[month - 1];

        return .{
            .year = @intCast(year),
            .month = @intCast(month),
            .day = @intCast(mday),
            .hour = @intCast(hour),
            .minute = @intCast(minute),
            .second = @intCast(sec),
            .millisecond = @intCast(ms),
        };
    }

    /// Format into an ISO 8601 time string. Example: 2024-12-31T23:59:59.999Z
    pub fn format(me: @This(), writer: anytype) !void {
        try writer.print(
            "{:0>4}-{:0>2}-{:0>2}T{:0>2}:{:0>2}:{:0>2}.{:0>3}",
            .{ me.year, me.month + 1, me.day + 1, me.hour, me.minute, me.second, me.millisecond },
        );
        try writer.writeAll("Z");
    }
};

pub fn customLog(
    comptime message_level: std.log.Level,
    comptime scope: @Type(.enum_literal),
    comptime format: []const u8,
    args: anytype,
) void {
    const level_txt = comptime message_level.asText();
    const prefix2 = if (scope == .default) "" else "(" ++ @tagName(scope) ++ ")";

    // Get current timestamp in milliseconds
    const now_ms: u64 = @intCast(std.time.milliTimestamp());
    const time = TimeParts.fromMsTimestamp(now_ms);

    // Print the formatted message first
    std.debug.print(format, args);
    // Then print the timestamp info with ISO 8601 format
    std.debug.print("    [ {s}{s}: {f} ]\n", .{ level_txt, prefix2, time });
}
