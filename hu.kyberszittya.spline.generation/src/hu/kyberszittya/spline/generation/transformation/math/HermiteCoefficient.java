package hu.kyberszittya.spline.generation.transformation.math;


public class HermiteCoefficient {
	private final Vec3 a0;
	private final Vec3 a1;
	private final Vec3 a2;
	private final Vec3 a3;
	
	private final double t0;
	
	
	
	public HermiteCoefficient(Vec3 a0, Vec3 a1, Vec3 a2, Vec3 a3, double t0) {
		super();
		this.a0 = a0;
		this.a1 = a1;
		this.a2 = a2;
		this.a3 = a3;
		this.t0 = t0;
	}
	
	public Vec3 getA0() {
		return a0;
	}
	public Vec3 getA1() {
		return a1;
	}
	public Vec3 getA2() {
		return a2;
	}
	public Vec3 getA3() {
		return a3;
	}
	public double getT0() {
		return t0;
	}
	
	

}
