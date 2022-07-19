const Vec3 = @import("vec.zig").Vec3;

pub const Hit = struct {
    position: Vec3,
    normal: Vec3,
    t: f32,

    pub fn new(position: Vec3, normal: Vec3, t: f32) Hit {
        return Hit{ .position = position, .normal = normal.normalize(), .t = t };
    }
};

test "new" {
    const std = @import("std");

    const p = Vec3.new(1, 1, 1);
    const n = Vec3.new(2, 3, 4);
    const t: f32 = 2.0;
    const hit = Hit.new(p, n, t);

    try std.testing.expect(hit.position.partial_eq(p));
    try std.testing.expect(hit.t == t);
    try std.testing.expectApproxEqAbs(hit.normal.length(), 1, 1e-6);
}
