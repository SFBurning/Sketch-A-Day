BCtrl control; 

void setup() {
	background(5);
	size(600,600);
	control = new BCtrl(width/4, height/2, (width/4)*3, height/2, 12);
}

void draw() {
	control.display();
}


void mousePressed() {
	control.cp1.clicked(mouseX, mouseY);
	control.cp2.clicked(mouseX, mouseY);
}

void mouseReleased() {
	control.cp1.stopDragging();
	control.cp2.stopDragging();
}

class BCtrl {

	float x1, x2;
	float y1, y2;
	ControlPoint cp1;
	ControlPoint cp2; 

	BCtrl(float x1_, float y1_, float x2_, float y2_, float r_) {

		float r = r_;
		float x1 = x1_;
		float x2 = x2_;
		float y1 = y1_;
		float y2 = y2_;

		ControlPoint cp1 = new ControlPoint(x1, y1, r);
		ControlPoint cp2 = new ControlPoint(x2, y2, r);

	}

	void display() {
		cp1.rollover(mouseX, mouseY);
		cp2.rollover(mouseX, mouseY);
		cp1.drag(mouseX, mouseY);
		cp2.drag(mouseX, mouseY);
		cp1.display();
		cp2.display();
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
