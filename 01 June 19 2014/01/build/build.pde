// How the fuck do pixels work

SweetBall ball1; 
SweetBall ball2; 

//oscP5




void setup() {
	size(512, 512);
	frameRate(25);
	background(0);
	ball1 = new SweetBall(40, width*0.25, height/2);
	ball2 = new SweetBall(40, (width*0.75), height/2); 
}

void draw() {
	background(0);
	ball1.display();
	loadPixels();
	for(int i = 0; i < pixels.length; i++) {
		if(i < (width * height)/2) {
			pixels[i] = invert(pixels[i]);
		}
	}
	updatePixels();
	ball2.display();
}

class SweetBall{
    float t; // Noise for perlin
    float r, rBase;
    float x,y;
	SweetBall(float r_, float x_, float y_) {  
		r = r_;
		rBase = r_;
		x = x_;
		y = y_;
		t = random(0, 100);
	}

	void display() {
		pushMatrix(); 
		y = map(mouseY, height, 0, height-height/4, height/4); 
		translate(x, y);
		t += 0.01;
		r = rBase + (noise(t)*(width/2));
		noStroke();
		fill(255, 30, 60);
		ellipse(0, 0, r,r);
		popMatrix();
	}
};

color invert(color c) {
	float x = map(mouseX, width, 0, 0, 255);
	float r = map(red(c), 0, 255, 255,x);
	float g = map(green(c), 0, 255, 255,x);
	float b = map(blue(c), 0, 255, 255,x);
	return color(r,g,b);
}