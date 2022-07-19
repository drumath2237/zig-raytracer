const expect = @import("std").testing.expect;
const sqrt = @import("std").math.sqrt;
const expectApproxEqAbs = @import("std").testing.expectApproxEqAbs;

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

    pub fn dot(v1: Vec3, v2: Vec3) f32 {
        return v1.x * v2.x + v1.y * v2.y + v1.z * v2.z;
    }

    pub fn length2(self: Vec3) f32 {
        return dot(self, self);
    }

    pub fn length(self: Vec3) f32 {
        return sqrt(self.length2());
    }

    pub fn normalize(self: Vec3) Vec3 {
        if (self.length2() == 0) {
            return Vec3.zero();
        }

        return self.devideScaler(self.length());
    }

    pub fn cross(a: Vec3, b: Vec3) Vec3 {
        return Vec3.new(a.y * b.z - a.z * b.y, a.z * b.x - a.x * b.z, a.x * b.y - a.y * b.x);
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

test "cross and dot product" {
    const v1 = Vec3.new(1, 2, 3);
    const v2 = Vec3.new(2, 3, 4);
    const v = Vec3.cross(v1, v2);

    try expect(Vec3.dot(v, v1) == 0);
    try expect(Vec3.dot(v, v2) == 0);
}

test "length and normalize" {
    const v1 = Vec3.new(1, 1, 1);

    try expect(v1.length2() == 3);
    try expect(v1.length() == sqrt(@as(f32, 3.0)));

    const normalized = v1.normalize();

    try expectApproxEqAbs(normalized.length(), 1.0, 1e-6);
}
