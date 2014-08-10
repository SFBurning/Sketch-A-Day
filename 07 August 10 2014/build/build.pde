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

	Mover() {
		location = new PVector(random(width), random(height));
		velocity = new PVector(random(-2,2),random(-2, 2));
	}

	void update() {
		location.add(velocity);
	}

	void display() {
		stroke(0);
		fill(175); 
		ellipse(location.x, location.y, width, height);
	}

	void checkEdges() {

		// Check x 
		if(location.x > width) {
			location.x = 0; 
		} else if (location.x < 0) {
			location.x = width; 
		}

		// Check y
		if(location.y > height) {
			location.y = 0;
		} else if(location.y < 0) {
			location.y = height; 
		}
	}

} 