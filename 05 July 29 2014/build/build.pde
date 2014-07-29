void setup() {
	
}

void draw() {
	
}

class Bar {

	// The total value of all the graph numbers
	float total;

	// An array of segments to handle incoming bullshit
	Segment[] segments = new Segment[0];

	// Constructor
	Bar(float total_) {
		p = p_;

	}

	// Create a new segment in the segments array
	Segment addSegment(float initValue) {
		// Add a new segment
		append(segments, new Segment(initValue)); 
		// Return the newly added segment
		return segments[segments.length-1];
	}

	// Add value to a segment. Just a shortcut to the segment's own add value function
	void addValue(float amount, int index) {
		segments[index].addValue(amount);
	}

};

class Segment extends Bar {
	// Data
	float subtotal;
	color c; 
	// Constructor 
	Segment(float subtotal_) {
		// Set the initial value
		subtotal = subtotal_;
		c = color(random(0,255), random(0,255), random(0,255));
	}

	//Add value
	void addValue(float amount) {
		p+=amount;
	}


};