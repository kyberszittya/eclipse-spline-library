package hu.kyberszittya.spline.generation.transformation.math

class ChordalControlVertexBuilder {
	
	
	
	def static HermiteCoefficient buildChordalCoefficient(
		Vec3 pm1, Vec3 p0, Vec3 p1, Vec3 p2, 
		double tension,
		double tm1, double t0, double t1, double t2) {
		val double dt  = t1 - t0
		val double dtm = t0 - tm1
		val v0 = ((p1 - p0)/dt + (p0 - pm1)/dtm) * tension
		val v1 = ((p2 - p1)/(t2 - t1) + (p1 - p0)/dt) * tension
		val Vec3 a0 = p0
		val Vec3 a1 = v0
		val Vec3 a2 = ((p1 - p0)*3.0)/(dt*dt) - (v1 + v0*2.0)/(dt)
		val Vec3 a3 = ((p0 - p1)*2.0)/(dt*dt*dt) + (v1 + v0)/(dt*dt)
		return new HermiteCoefficient(a0, a1, a2, a3, t0)
	}
	
	def static double chordalParameter(Vec3 p1, Vec3 p2, double t, double alpha){
		return Math::pow(
			Math::sqrt(
				(p1.x - p2.x) * (p1.x - p2.x) +
				(p1.y - p2.y) * (p1.y - p2.y)), alpha) + t
	}
	
	

	def static ControlVertex buildControlVertex(Vec3 pm1, Vec3 p0, Vec3 p1, Vec3 p2, 
		double tm1, double t, double tension, double alpha
	) {
		var double t1 = chordalParameter(p0, p1, t, alpha)
		var double t2 = chordalParameter(p1, p2, t1, alpha)
		
		return new ControlVertex(
			buildChordalCoefficient(pm1, p0, p1, p2, tension, tm1, t, t1, t2), 
			p0, t1
		)
	}
	
	
}
