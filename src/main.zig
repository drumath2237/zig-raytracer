const std = @import("std");

const Vec3 = @import("vec.zig").Vec3;

pub fn main() anyerror!void {
    const v = Vec3.new(1, 2, 3);

    std.debug.print("({d}, {d}, {d})", .{ v.x, v.y, v.z });
}
