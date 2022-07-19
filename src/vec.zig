const expect = @import("std").testing.expect;

pub const Vec3 = struct {
    x: f32,
    y: f32,
    z: f32,

    pub fn new(x: f32, y: f32, z: f32) Vec3 {
        return Vec3{ .x = x, .y = y, .z = z };
    }

    pub fn zero() Vec3 {
        return Vec3.new(0, 0, 0);
    }

    pub fn partial_eq(self: Vec3, other: Vec3) bool {
        return self.x == other.x and self.y == other.y and self.z == other.z;
    }

    pub fn add(self: Vec3, v: Vec3) Vec3 {
        return Vec3.new(self.x + v.x, self.y + v.y, self.z + v.z);
    }

    pub fn sub(self: Vec3, v: Vec3) Vec3 {
        return Vec3.new(self.x - v.x, self.y - v.y, self.z - v.z);
    }

    pub fn mul(self: Vec3, v: Vec3) Vec3 {
        return Vec3.new(self.x * v.x, self.y * v.y, self.z * v.z);
    }

    pub fn mulScaler(self: Vec3, f: f32) Vec3 {
        return Vec3.new(self.x * f, self.y * f, self.z * f);
    }

    pub fn devide(self: Vec3, v: Vec3) Vec3 {
        return Vec3.new(self.x / v.x, self.y / v.y, self.z / v.z);
    }

    pub fn devideScaler(self: Vec3, f: f32) Vec3 {
        return Vec3.new(self.x / f, self.y / f, self.z / f);
    }
};

test "new and zero" {
    const v = Vec3.new(1, 2, 3);
    try expect(v.x == 1);
    try expect(v.y == 2);
    try expect(v.z == 3);

    const zero = Vec3.zero();
    try expect(zero.x == 0);
    try expect(zero.y == 0);
    try expect(zero.z == 0);
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

    try expect(v2.sub(v1).partial_eq(Vec3.new(1, 1, 1)));

    try expect(v1.mul(v2).partial_eq(Vec3.new(2, 6, 12)));

    try expect(v1.mulScaler(2).partial_eq(Vec3.new(2, 4, 6)));

    try expect(v1.devide(v2).partial_eq(Vec3.new(1.0 / 2.0, @as(f32, 2.0 / 3.0), @as(f32, 3.0 / 4.0))));

    try expect(v1.devideScaler(2).partial_eq(Vec3.new(1.0 / 2.0, 1, 3.0 / 2.0)));
}
