package hu.kyberszittya.spline.generation.transformation.math

import com.google.common.collect.ImmutableList
import java.util.Collection
import com.google.common.collect.ImmutableCollection
import com.google.common.collect.RangeMap
import com.google.common.collect.TreeRangeMap
import com.google.common.collect.Range
import java.util.Map
import java.util.LinkedList

class CatmullRomSpline {
	val RangeMap<Double, ControlVertex> controlvertices;
	val boolean closed;
	
	var double maxt = 0.0
	var double mint = 0.0
	
	new(Collection<Vec3> points, boolean closed, double tension, double alpha){
		controlvertices = TreeRangeMap.create()
		var loc_points = new LinkedList<Vec3>();
		var double tm1 = 0.0;
		var double t = 0.0;
		if (closed){
			loc_points.add(points.get(points.size - 1))
			loc_points.addAll(points)
			val p0 = points.get(0)
			val p1 = points.get(1)
			loc_points.add(p0)
			loc_points.add(p1)
			t = ChordalControlVertexBuilder::chordalParameter(
				loc_points.get(0),
				loc_points.get(1),
				tm1,
				0.5
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
	
	public def double getMinT(){
		return mint;
	}
	
	public def double getMaxT(){
		return maxt;
	}
}
