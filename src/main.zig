const std = @import("std");

const add = @import("add.zig").add;

pub fn main() anyerror!void {
    // Note that info level log messages are by default printed only in Debug
    // and ReleaseSafe build modes.
    std.log.info("All your codebase are belong to us.", .{});

    std.debug.print("{d}", .{add(1, 2)});
}

test "basic test" {
    try std.testing.expectEqual(10, 3 + 7);
}
