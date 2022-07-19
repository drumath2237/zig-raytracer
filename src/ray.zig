const Vec3 = @import("vec.zig").Vec3;

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
