package hu.kyberszittya.spline.generation.transformation;

import java.awt.Color;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JFrame;

import hu.kyberszittya.spline.generation.transformation.math.CatmullRomSpline;
import hu.kyberszittya.spline.generation.transformation.math.Vec3;
import hu.kyberszittya.spline.generation.transformation.visualization.SplineWindow;


public class ExampleProgram {
	public static void main(String[] args) {
		List<Vec3> cvs = new ArrayList<Vec3>();
		
		cvs.add(new Vec3(100.0, 200.0, 0.0));
		cvs.add(new Vec3(200, 400, 0.0));
		cvs.add(new Vec3(400, 200, 0.0));
		cvs.add(new Vec3(300, 100, 0.0));
		cvs.add(new Vec3(170, 20, 0.0));
		CatmullRomSpline cv = new CatmullRomSpline(cvs, true, 0.9, 0.6);
		
		final JFrame frame = new JFrame();
		frame.setSize(800, 800);
		frame.setBackground(Color.WHITE);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		SplineWindow win = new SplineWindow(cv);
		frame.add(win);
		frame.setVisible(true);
		
	}
}
