const std = @import("std");

const Vec3 = @import("vec.zig").Vec3;

pub fn main() anyerror!void {
    const v1 = Vec3.new(1, 2, 3);
    const v2 = Vec3.new(2, 3, 4);

    const v = v1.devide(v2);

    const c: f32 = 2.0 / 3.0;

    std.debug.print("({d}, {d}, {d})\n", .{ v.x, v.y, v.z });
    std.debug.print("{d}\n", .{c});
}
