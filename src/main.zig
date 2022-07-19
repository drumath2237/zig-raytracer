const std = @import("std");

const Vec3 = @import("vec.zig").Vec3;
const Ray = @import("ray.zig").Ray;

pub fn main() anyerror!void {
    const v1 = Vec3.new(1, 2, 3);
    const v2 = Vec3.new(2, 3, 4);
    const v = Vec3.cross(v2, v1);

    std.debug.print("({d} {d} {d} )\n", .{ v.x, v.y, v.z });
    std.debug.print("({d})\n", .{Vec3.dot(v, v1)});

    std.debug.print("{d}", .{v1.normalize().length2()});
}

test {
    _ = @import("vec.zig");
    _ = @import("ray.zig");
    _ = @import("sphere.zig");
}
