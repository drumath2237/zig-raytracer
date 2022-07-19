const Vec3 = @import("vec.zig").Vec3;

const expect = @import("std").testing.expect;

pub const Sphere = struct {
    o: Vec3,
    r: f32,

    pub fn new(o: Vec3, r: f32) Sphere {
        return .{ .o = o, .r = r };
    }
};

test "new" {
    const sphere = Sphere.new(Vec3.zero(), 2);

    try expect(sphere.o.partial_eq(Vec3.new(0, 0, 0)));
    try expect(sphere.r == 2);
}
