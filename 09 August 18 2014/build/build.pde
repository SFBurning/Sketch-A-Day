// Tracer via 3D box
import peasy.*;

PeasyCam cam;
CustoCube myCube;
PVector initLoc;
PVector initDim;
PVector wind;

void setup() {
	//Camera setup
	size(600,600,P3D);
	cam = new PeasyCam(this, 100);
	cam.setMinimumDistance(1);
	cam.setMaximumDistance(2000);
	myCube = new CustoCube();
	wind = new PVector(0,.01,.01);
}

void draw() {
	stroke(255, 170);
	//sphere(40);
	background(40);
	//camera(0, 0, -2200, 0, 0, 0, 0, 0, 0);
	lights();
	myCube.applyForce(wind);
	myCube.update();
	myCube.render();
}

