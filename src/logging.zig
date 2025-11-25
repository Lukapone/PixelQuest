const std = @import("std");

pub const want_custom_logfn = false;
//if we have std_options defined we override the default options
pub const std_options = std.Options{
    // Set the log level to info
    .log_level = .debug,
    // .log_level = .info,
    .log_scope_levels = &[_]std.log.ScopeLevel{
        .{ .scope = .main, .level = .debug },
        .{ .scope = .window, .level = .debug },
        .{ .scope = .game, .level = .info },
        .{ .scope = .fps, .level = .err },
    },
    .logFn = if (want_custom_logfn) customLog else std.log.defaultLog,
};

pub fn customLog(
    comptime message_level: std.log.Level,
    comptime scope: @Type(.enum_literal),
    comptime format: []const u8,
    args: anytype,
) void {
    const level_txt = comptime message_level.asText();
    const prefix2 = if (scope == .default) ": " else "(" ++ @tagName(scope) ++ "): ";

    std.debug.print("TEST " ++ level_txt ++ prefix2 ++ format ++ "\n", args);
}