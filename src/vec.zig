const expect = @import("std").testing.expect;

pub const Vec3 = struct {
    x: f32,
    y: f32,
    z: f32,

    pub fn new(x: f32, y: f32, z: f32) Vec3 {
        return Vec3{ .x = x, .y = y, .z = z };
    }

    pub fn partial_eq(self: Vec3, other: Vec3) bool {
        return self.x == other.x and self.y == other.y and self.z == other.z;
    }

    pub fn add(self: Vec3, v: Vec3) Vec3 {
        return Vec3.new(self.x + v.x, self.y + v.y, self.z + v.z);
    }
};

test "new" {
    const v = Vec3.new(1, 2, 3);
    try expect(v.x == 1);
    try expect(v.y == 2);
    try expect(v.z == 3);
}

test "eq" {
    const v1 = Vec3.new(1, 2, 3);
    const v2 = Vec3.new(1, 2, 3);

    try expect(v1.partial_eq(v2));
}

test "operators" {
    const v1 = Vec3.new(1, 2, 3);
    const v2 = Vec3.new(2, 3, 4);
    const sum = v1.add(v2);

    try expect(sum.partial_eq(Vec3.new(3, 5, 7)));
}
