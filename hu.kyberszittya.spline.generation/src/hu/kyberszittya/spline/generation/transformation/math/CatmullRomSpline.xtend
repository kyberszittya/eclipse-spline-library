package hu.kyberszittya.spline.generation.transformation.math

import java.util.Collection
import com.google.common.collect.RangeMap
import com.google.common.collect.TreeRangeMap
import com.google.common.collect.Range
import java.util.LinkedList
import java.util.List

class CatmullRomSpline {
	val RangeMap<Double, ControlVertex> controlvertices;
	var boolean closed;
	val Collection<Vec3> orig_points;
	
	var double maxt = 0.0
	var double mint = 0.0
	var double tension = 0.5
	var double alpha = 0.5
	
	new(Collection<Vec3> points, boolean closed, double tension, double alpha){
		this.closed = closed
		controlvertices = TreeRangeMap.create()
		orig_points = points
		this.tension = tension
		this.alpha = alpha
		initialize()
	}
	
	public final def void setTension(double tension){
		this.tension = tension
	}
	
	public final def void setAlpha(double alpha){
		this.alpha = alpha
	}
	
	public final def initialize(){
		var double tm1 = 0.0;
		var double t = 0.0;
		var List<Vec3> loc_points = new LinkedList<Vec3>();
		if (closed){
			loc_points.add(orig_points.get(orig_points.size - 1))
			loc_points.addAll(orig_points)
			val p0 = orig_points.get(0)
			val p1 = orig_points.get(1)
			loc_points.add(p0)
			loc_points.add(p1)
			t = ChordalControlVertexBuilder::chordalParameter(
				loc_points.get(0),
				loc_points.get(1),
				tm1, alpha
			)
			mint = t	
		}		
		
		for (var int i = 1; i < loc_points.size - 2; i++){
			val cv = ChordalControlVertexBuilder.buildControlVertex(
				loc_points.get(i - 1),
				loc_points.get(i),
				loc_points.get(i + 1),
				loc_points.get(i + 2),
				tm1, t, tension, alpha
			)
			val t_new = cv.t
			
			controlvertices.put(
				Range.closedOpen(t, t_new), 
				cv
			)
			tm1 = t
			t = t_new
			
			maxt = t
		}
		this.closed = closed;
	}
	
	public final def RangeMap<Double, ControlVertex> getControlVertices(){
		return controlvertices;
	}
	
	// Zero order value of Catmull-Rom spline	
	public final def Vec3 rt(double t){
		val i = controlvertices.get(t).interp		
		val double dt = t - i.t0
		return i.a0 + i.a1*dt + i.a2*dt*dt + i.a3*dt*dt*dt
	}
	
	
	// First order derivative of Catmull-Rom spline
	public final def Vec3 drt(double t){
		val i = controlvertices.get(t).interp		
		val double dt = t - i.t0
		return i.a1 + i.a2*dt*2.0 + i.a3*dt*dt*3.0
	}
	
	// First order normalized derivative of Catmull-Rom spline
	public final def Vec3 drt_normalized(double t){
		val i = controlvertices.get(t).interp		
		val double dt = t - i.t0
		return (i.a1 + i.a2*dt*2.0 + i.a3*dt*dt*3.0).normalize
	}
	
	public def double getMinT(){
		return mint;
	}
	
	public def double getMaxT(){
		return maxt;
	}
}
