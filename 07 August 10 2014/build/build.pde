// Learning some shit about PVectors
// Holla @ yr boy. 

Mover mover;

void setup() {
	size(600, 800);	
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
	float diameter;

	Mover() {
		location = new PVector(random(width), random(height));
		velocity = new PVector(random(-70,70),random(-70, 70));
		println("velocity.x: "+velocity.x);
		println("velocity.y: "+velocity.y);
		oldPos = new float[200][2];
		diameter = 50; 
		for(int i = 0; i < oldPos.length; i++) {
			oldPos[i][0] = location.x;
			oldPos[i][1] = location.y;
		}
	}

	void update() {

		location.add(velocity);
		// Shift the array
		for(int i = 0; i < oldPos.length-1; i++) {
			oldPos[i][0] = oldPos[i+1][0];
			oldPos[i][1] = oldPos[i+1][1];
		}
		// Add the newest value
		oldPos[oldPos.length-1][0] = location.x;
		oldPos[oldPos.length-1][1] = location.y;


	}

	void display() {

		// Paint the ever-decreasing trail of coolness
		for(int i = 0; i < oldPos.length - 1; i ++) {
			noStroke();
			float opc = map(i, 0, oldPos.length, 0, 255);
			float curDiameter = map(i, 0, oldPos.length, 5, diameter);
			fill(opc);
			ellipse(oldPos[i][0], oldPos[i][1], curDiameter, curDiameter);
		}

		// Paint the main circle with a stroke around it
		/*
		stroke(255,0,0);
		strokeWeight(10);
		fill(175); 
		ellipse(location.x, location.y, diameter, diameter);
		*/
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