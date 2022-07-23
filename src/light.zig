const Vec3 = @import("vec.zig").Vec3;

pub const DirectionalLight = struct {
    direction: Vec3,

    pub fn new(d: Vec3) DirectionalLight {
        return DirectionalLight{ .direction = d.normalize() };
    }
};

test "new" {
    const std = @import("std");

    const d = Vec3.new(1, 2, 3);
    const light = DirectionalLight.new(d);

    try std.testing.expectApproxEqAbs(light.direction.length(), @as(f32, 1.0), 1e-6);
    try std.testing.expectApproxEqAbs(Vec3.dot(d.normalize(), light.direction.normalize()), @as(f32, 1.0), 1e-6);
}
