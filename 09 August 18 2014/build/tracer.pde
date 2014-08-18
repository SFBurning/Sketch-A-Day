class Tracer {
	float r; // Radius
	PVector loc; // Location
	PVector[] prevLoc; // Previous Locations
	Tracer() {
		loc = new PVector(0,0,0);
		prevLoc = new PVector[10];
		for(int i = 0; i < prevLoc.length; i++) {
			prevLoc[i] = new PVector(0,0,0);
		}
		r = 5;
	}

	void update(PVector newLoc) {
		println("newLoc:" + newLoc);
		PVector newLocCopy = newLoc.get();
		for(int i = 1; i < prevLoc.length; i++) {
			prevLoc[i-1] = prevLoc[i].get();
		}
		prevLoc[prevLoc.length-1] = loc.get(); 
	}

	void render() {
		for(int i = 0; i < prevLoc.length; i++) {
			stroke(255);
			fill(map(i, 0, prevLoc.length, 255, 0));
			pushMatrix();
				if(i == prevLoc.length-1) {
					//println("Creating sphere at "+prevLoc[i]);
				}
				translate(loc.x, loc.y, loc.z);
				sphere(map(i, 0, prevLoc.length, 0, r));
			popMatrix();
		}
	}
}