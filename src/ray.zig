const Vec3 = @import("vec.zig").Vec3;

const expect = @import("std").testing.expect;

pub const Ray = struct {
    o: Vec3,
    d: Vec3,

    pub fn new(o: Vec3, d_normalized: Vec3) Ray {
        return Ray{ .o = o, .d = d_normalized };
    }

    pub fn t(self: Ray, f: f32) Vec3 {
        return self.o.add(self.d.mulScaler(f));
    }
};

test "new" {
    const o = Vec3.zero();
    const d = Vec3.new(1, 0, 0);

    const ray = Ray.new(o, d);

    try expect(ray.o.partial_eq(o));
    try expect(ray.d.partial_eq(d));
}

test "t" {
    const o = Vec3.new(1, 2, 3);
    const d = Vec3.new(1, 0, 0);
    const ray = Ray.new(o, d);

    try expect(ray.o.partial_eq(o));
    try expect(ray.d.partial_eq(d));
}
