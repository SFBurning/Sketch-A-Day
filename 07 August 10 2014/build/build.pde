// Learning some shit about PVectors
// Holla @ yr boy. 

Mover mover;

void setup() {
	size(600, 600);	
	mover = new Mover();
}

void draw() {
	background(5);
	mover.update();
	mover.checkEdges();
	mover.display();
}

class Mover {

	PVector location;
	PVector velocity;
	float[][] oldPos;

	Mover() {
		location = new PVector(random(width), random(height));
		velocity = new PVector(random(-20,20),random(-20, 20));
		oldPos = new float[30][2];
		for(int i = 0; i < oldPos.length; i++) {
			oldPos[i][0] = location.x;
			oldPos[i][1] = location.y;
		}
	}

	void update() {

		location.add(velocity);
		for(int i = 0; i < oldPos.length; i++) {
			old
		}
	}

	void display() {
		stroke(0);
		fill(175); 
		ellipse(location.x, location.y, 16, 16);
	}

	void checkEdges() {

		// Check x 
		if(location.x > width) {
			velocity.x *= -1;
		} else if (location.x < 0) {
			velocity.x *= -1; 
		}

		// Check y
		if(location.y > height) {
			velocity.y *= -1;
		} else if(location.y < 0) {
			velocity.y *=-1; 
		}
	}

} 