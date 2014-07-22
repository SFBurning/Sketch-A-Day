BCtrl control; 

// Setup, Bitch!
void setup() {
	size(600,600);
	control = new BCtrl(width/4, height/2, (width/4)*3, height/2, 12);
}

// Draw, Bitch!
void draw() {
	background(5);
	control.display();
}

// MousePressed
void mousePressed() {
	// Perform click operations
	control.cp1.clicked(mouseX, mouseY);
	control.cp2.clicked(mouseX, mouseY);
	control.vt1.clicked(mouseX, mouseY);
	control.vt2.clicked(mouseX, mouseY);
}

// MouseReleased
void mouseReleased() {
	// Make sure everything stops dragging when the mouse is released
	control.cp1.stopDragging();
	control.cp2.stopDragging();
	control.vt1.stopDragging();
	control.vt2.stopDragging();
}

// This bezier control class will also spawn instances of the ControlVertex class
// This is responsible for calling the functions of our two CV instances, and drawing the curve 
class BCtrl {

	float x1, x2;
	float y1, y2;
	// Control Points
	ControlPoint cp1, cp2;
	// Vertices
	ControlPoint vt1, vt2; 

	BCtrl(float x1_, float y1_, float x2_, float y2_, float r_) {

		float r = r_;
		float x1 = x1_;
		float x2 = x2_;
		float y1 = y1_;
		float y2 = y2_;

		cp1 = new ControlPoint(x1, y1, r);
		cp2 = new ControlPoint(x2, y2, r);
		vt1 = new ControlPoint(width/4, height/3, 20);
		vt2 = new ControlPoint((width/4)*3, height/3, 20);


	}

	void display() {
		noFill();
		stroke(255, 0, 0);
		strokeWeight(5);
		curve(this.cp1.x, cp1.y, vt1.x, vt1.y, vt2.x, vt2.y, cp2.x, cp2.y);
		cp1.rollover(mouseX, mouseY);
		cp2.rollover(mouseX, mouseY);
		vt1.rollover(mouseX, mouseY);
		vt2.rollover(mouseX, mouseY);
		cp1.drag(mouseX, mouseY);
		cp2.drag(mouseX, mouseY);
		vt1.drag(mouseX, mouseY);
		vt2.drag(mouseX, mouseY);
		cp1.display();
		cp2.display();
		vt1.display();
		vt2.display();
	}


};

class ControlPoint {

	float x, y; // Position
	float offsetX, offsetY; // mouseclick offset
	float r; // Radius
	boolean dragging = false;
	boolean rollover = false; 

	ControlPoint(float x_, float y_, float r_) {
		x = x_;
		y = y_;
		r = r_;
		offsetX = 0;
		offsetY = 0;

	}

	void display() {
		stroke(0);
		if(dragging) fill(50);
		else if (rollover) fill(100);
		else fill(175, 200);
		ellipse(x, y, r*2, r*2);
	}

	void clicked(int mx, int my) {
		if((mx > x - r && mx < x + r) && (my > y - r && my < y + r)) {
			dragging = true;
			offsetX = x - mx; 
			offsetY = y - my;
		}
	}

	void rollover(int mx, int my) {
		if((mx > x - r && mx < x + r) && (my > y - r && my < y + r)) {
			rollover = true;
		} else {
			rollover = false;
		}
	}

	void drag(int mx, int my) {
		if(dragging) {
			x = mx + offsetX;
			y = my + offsetY;
		}
	}

	void stopDragging() {
		dragging = false; 
	}

};
