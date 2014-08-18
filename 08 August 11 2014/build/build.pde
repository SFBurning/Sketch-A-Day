SpinCube[] cubes;

void setup() {
	size(600,600, P3D);
	cubes = new SpinCube[5];
	for(int i =0; i < cubes.length; i++) {
		cubes[i] = new SpinCube(random(5,100), random(-5,5),random(-5,5),random(-5,5));
	}
}

void draw() {
	background(0)	;
	camera(0, 0, -100, 0, 0, 0, 1, 1, 1);
	for(int i = 0; i < cubes.length; i++) {
		cubes[i].display(); 
	}

}

class SpinCube {

	float s; //Size
	float xs;
	float ys;
	float zs; //Per-axis sping velocities

	SpinCube(float s_, float xs_,float ys_,float zs_) { 

		s  = s_;
		xs = xs_;
		ys = ys_;
		zs = zs_;

		
	}

	void display(){
		stroke(255);
		noFill();
		rotateX(frameCount * radians(xs));
		rotateY(frameCount * radians(ys));
		rotateZ(frameCount * radians(zs));
		box(s, s, s);
		
	}

}