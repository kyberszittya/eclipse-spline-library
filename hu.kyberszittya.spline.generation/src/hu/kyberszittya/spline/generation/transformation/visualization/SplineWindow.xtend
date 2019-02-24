package hu.kyberszittya.spline.generation.transformation.visualization

import java.awt.Graphics
import javax.swing.JPanel
import hu.kyberszittya.spline.generation.transformation.math.CatmullRomSpline
import java.awt.Color
import java.util.List
import java.util.ArrayList

class SplineWindow extends JPanel {
	val CatmullRomSpline cs;
	
	new(CatmullRomSpline cv){
		this.cs = cv;
	}
	
	override protected void paintComponent(Graphics g) {
		cs.controlVertices.asMapOfRanges.values.forEach[ v, i |
			g.color = Color.RED
			g.fillOval(
				(v.position.x as int) - 10,
				(v.position.y as int) - 10,
				20,20
			)
			g.drawString(Integer.toString(i), v.position.x as int, v.position.y as int)			
		]
		val List<Integer> xs = new ArrayList() 
		val List<Integer> ys = new ArrayList()
		g.color = Color.BLUE
		for (var double t = cs.minT; t < cs.maxT; t+=0.1){
			val r = cs.rt(t);
			xs.add(r.x as int)
			ys.add(r.y as int)
		}
		g.drawPolyline(xs, ys, ((cs.maxT - cs.minT)/0.1) as int)
	}
}
