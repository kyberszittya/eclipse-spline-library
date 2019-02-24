package hu.kyberszittya.spline.generation.transformation.math;


public class ControlVertex {
	private final HermiteCoefficient interp;
	private final Vec3 position;
	private final double t;
	
	public ControlVertex(HermiteCoefficient interp, Vec3 position, double t) {
		super();
		this.interp = interp;
		this.position = position;
		this.t = t;
	}
	
	public HermiteCoefficient getInterp() {
		return interp;
	}
	public Vec3 getPosition() {
		return position;
	}
	
	public double getT() {
		return t;
	}
}
