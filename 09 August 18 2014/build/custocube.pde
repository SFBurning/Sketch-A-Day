class CustoCube {
	// Location, acceleration, velocity
	PVector loc, acc, vel;
	// Dimensions
	PVector dim;
	// Object mass
	float mass;
	Tracer[] dots;

	CustoCube() {
		mass = 1; 
		loc = new PVector(0,0,0);
		dim = new PVector(1000,2000,3000);
		acc = new PVector(0,0,0);
		vel = new PVector(0,0,0);
		dots = new Tracer[8];
		for(int i = 0; i < dots.length; i++) {
			dots[i] = new Tracer();
		}

	}

	// Update the vectors
	void update() {
		// println("Adding acc to velocity");
		// println("vel: "+vel);
		// println("acc:"+acc);
		vel.add(acc);
		// println("Done!");
		// println("vel: "+vel);
		// println("acc:"+acc);
		loc.add(vel);
		acc.mult(0);
		//println("loc.x: "+loc.x+" loc.y: "+loc.y+" loc.z: "+loc.z);
		// println("loc: "+loc);
	}

	// Apply force calculations
	void applyForce(PVector force) {
		PVector f = force.get();
		f.div(mass);
		acc.add(f);
	}

// Render out four  in a cube pattern
	void render() {
	
		for(int i = 0; i < dots.length; i++) {
			// Dimension values
			float x, y, z;
			x = 0;
			y = 0;
			z = 0; 
			// Top bottom separation
			if(i % 2 == 0)	{ // Top Level
				y = dim.y/2;
			} else { // Bottom Level
				y = dim.y/2*-1;
			}
			// X and Z
			int cycler = i % 4;
			switch (cycler) {
				case 0: 
					//println("Case 0");
					x = dim.x/2;
					z = dim.z/2;
					break;
				case 1: 
					//println("Case 1");
					x = dim.x/2*-1;
					z = dim.z/2*-1;
					break;
				case 2: 
					//println("Case 2");
					x = dim.x/2*-1;
					z = dim.z/2;
					break;
				case 3:
					//println("Case 3");
					x = dim.x/2;
					z = dim.z/2*-1;					
					break;
			}
			//println("x: "+x);
			//println("z: "+z);
			// Assign the final vector
			PVector newLoc = new PVector(x,y,z);
			newLoc.add(loc);
			dots[i].update(newLoc);
			dots[i].render();
		}
	}
}