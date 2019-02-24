package hu.kyberszittya.spline.generation.transformation;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JSlider;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;

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
		final FlowLayout layout = new FlowLayout();
		final JPanel controls = new JPanel();
		final JSlider tension_slider = new JSlider(0, 1000);
		SplineWindow win = new SplineWindow(cv);
		tension_slider.addChangeListener(new ChangeListener() {
			
			@Override
			public void stateChanged(ChangeEvent e) {
				double val = (((JSlider)e.getSource()).getValue())/1000.0;
				cv.setTension(val);
				cv.initialize();
				frame.invalidate();
				frame.repaint();
			}
		});
		final JSlider alpha_slider   = new JSlider(0, 1000);
		alpha_slider.addChangeListener(new ChangeListener() {
			
			@Override
			public void stateChanged(ChangeEvent e) {
				double val = (((JSlider)e.getSource()).getValue())/1000.0;
				cv.setAlpha(val);
				cv.initialize();
				frame.invalidate();
				frame.repaint();
			}
		});
		frame.setSize(800, 800);
		frame.setBackground(Color.WHITE);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		win.setPreferredSize(new Dimension(800, 600));
		frame.add(win);
		controls.add(new JLabel("Tension"));
		controls.add(tension_slider);
		controls.add(new JLabel("Alpha"));
		controls.add(alpha_slider);
		frame.setLayout(layout);
		frame.add(controls, BorderLayout.SOUTH);
		frame.setVisible(true);
		
	}
}
