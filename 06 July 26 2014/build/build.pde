void setup() {
	size(600, 600);
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
		total = total_;

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

	void updateData() {
		// Cycle through the values of the segment totals, and figure out their percentages
		total = 0;
		for(int i = 0; i<segments.length; i++) {
			total += segments[i].subtotal; 
		}
		// Cycle through again, now assigning the appropriate percentage
		for(int i = 0; i<segments.length; i++) {
			segments[i].assignPercent((segments[i].subtotal)/total);
		}
	}

	void animate() {
		for(int i = 0; i < segments.length; i++) {
			
		}
	}

};

public class Segment {
	// Data
	float subtotal;
	color c;
	float percent; 
	// if the mouse is over the segment
	boolean mouseOver;
	// Data stores for rect()
	float px, py, w, h;

	// Constructor 
	Segment(float subtotal_) {
		// Set the initial value
		subtotal = subtotal_;
		c = color(random(0,255), random(0,255), random(0,255));
	}

	//Add value
	void addValue(float amount) {
		subtotal+=amount;
	}

	void assignPercent(float tempPercent) {
		percent = tempPercent; 
	}


};