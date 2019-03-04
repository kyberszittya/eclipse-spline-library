package hu.kyberszittya.spline.generation.test


import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test
import hu.kyberszittya.spline.generation.transformation.math.Vec3

class TestVec3 {
	@Test
	def void testAddition(){
		val Vec3 v0 = new Vec3(0.0, 0.0, 0.0);
		val Vec3 v1 = new Vec3(1.0, 1.0, 1.0);
		val v2 = v0 + v1
		assertEquals(1.0, v2.x)
		assertEquals(1.0, v2.y)
		assertEquals(1.0, v2.z)
	}
	
	@Test
	def void testSubtraction(){
		val Vec3 v0 = new Vec3(2.0, 2.0, 2.0);
		val Vec3 v1 = new Vec3(1.0, 1.0, 1.0);
		val v2 = v0 - v1
		assertEquals(1.0, v2.x)
		assertEquals(1.0, v2.y)
		assertEquals(1.0, v2.z)
	}
	
	@Test
	def void testMultiplyCoeff(){
		val Vec3 v0 = new Vec3(2.0, 2.0, 2.0);
		val v2 = v0 * 2.0
		assertEquals(4.0, v2.x)
		assertEquals(4.0, v2.y)
		assertEquals(4.0, v2.z)
	}
	
	@Test
	def void testDivCoeff(){
		val Vec3 v0 = new Vec3(2.0, 2.0, 2.0);
		val v2 = v0 / 2.0
		assertEquals(1.0, v2.x)
		assertEquals(1.0, v2.y)
		assertEquals(1.0, v2.z)
	}
}