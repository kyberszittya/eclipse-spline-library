package hu.sze.jkk.racecar.environment.generator.test

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test
import hu.kyberszittya.spline.generation.transformation.math.Vec3
import hu.kyberszittya.spline.generation.transformation.math.ChordalControlVertexBuilder

class TestChordalHermite {
	@Test
	def void testChordalParameter(){
		val Vec3 p0 = new Vec3(0.0, 0.0, 0.0)
		val Vec3 p1 = new Vec3(1.0, 1.0, 0.0)
		val t = ChordalControlVertexBuilder::chordalParameter(p0, p1, 0.0, 0.5)
		assertEquals(Math.sqrt(Math.sqrt(2)), t);
	}
	
	@Test
	def void testChordalCoefficient(){
		// Define 4 points for chordal coefficient calculation
		val Vec3 p0 = new Vec3(0.0, 0.0, 0.0)
		val Vec3 p1 = new Vec3(1.0, 1.0, 1.0)
		val Vec3 p2 = new Vec3(2.0, 0.0, 0.0)
		val Vec3 p3 = new Vec3(3.0, 1.0, 0.0)
		val t0 = 0.0
		val t1 = 1.0
		val t2 = 2.0
		val t3 = 3.0
		val h = ChordalControlVertexBuilder::buildChordalCoefficient(
			p0, p1, p2, p3, 0.5, t0, t1, t2, t3 
		)
		assertEquals(1, h.a0.x)
		assertEquals(1, h.a0.y)
		assertEquals(1, h.a0.z)
		// Test velocity component
		assertEquals(1, h.a1.x)
		assertEquals(0, h.a1.y)
		assertEquals(0, h.a1.z)
		// Test quadratic component
		assertEquals(0, h.a2.x)
		assertEquals(-3, h.a2.y)
		assertEquals(-2.5, h.a2.z)
		// Test cubic component
		assertEquals(0, h.a3.x)
		assertEquals(2, h.a3.y)
		assertEquals(1.5, h.a3.z)
	}
}