package hu.kyberszittya.spline.generation.transformation.math


public class Vec3 {
	final package double x
	final package double y
	final package double z

	new(double x, double y, double z) {
		super()
		this.x = x
		this.y = y
		this.z = z
	}

	def double getX() {
		return x
	}

	def double getY() {
		return y
	}

	def double getZ() {
		return z
	}

	def Vec3 operator_plus(Vec3 e2) {
		return new Vec3(x + e2.x, y + e2.y, z + e2.z)
	}
	
	def Vec3 operator_minus(Vec3 e2) {
		return new Vec3(x - e2.x, y - e2.y, z - e2.z)
	}
	
	def Vec3 operator_multiply(double e2) {
		return new Vec3(x * e2, y * e2, z * e2)
	}
	
	def Vec3 operator_divide(double e2) {
		return new Vec3(x / e2, y / e2, z / e2)
	}
	
	def double length(){
		return Math.sqrt(x*x+y*y+z*z)
	}
	
	def Vec3 normalize(){
		return new Vec3(x,y,z)/length()
	}
}
