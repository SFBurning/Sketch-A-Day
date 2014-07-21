package processing.test.build;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class build extends PApplet {

// Stores the data read in by an external text file
String[] data;

// Each intance of "bars" represents one line of text from the source file
Bar[] bars; 

public void setup() {

	background(0,0,0); // This is likely redundant.
	// Pull in some dope-ass text info
	// This is a constant for now but in the future should behandled by an open dialog
	data = loadStrings("haiku.txt"); 
	// Initialize the bars array, with a length equal to the number of lines in the text file. 
	Bar[] bars = new Bar[data.length];
	// Initialize bars for every line of text
	for (int i = 0; i < data.length; i ++) {
		// Make sure this isn't an empty line.
		if(data[i].length() > 0) {
			bars[i] = new Bar(bars.length, data[i], i);
		} else {
			// Temp solution Replace this shit!
			bars[i] = new Bar(bars.length, "null", i);
		}
	}
	// Print the max width of each bar
	for(int i = 0; i < bars.length; i++) {
		bars[i].display();
	}

}

public void draw() {
	//bars[i].display();
}

// Hey now woah now look at these bars now. 
public class Bar {

	int numLines;
	int curIndex; 
	String curLine;
	float maxHeight;
	String[] words;
	float maxWidth;
	float heightRange;

	Bar(int numLines_, String curLine_, int curIndex_) {
		numLines = numLines_;
		curLine = curLine_;
		curIndex = curIndex_;
		// Split the given line into words
		words = splitTokens(curLine, " .");
		// Figure out the maximum height for the bars
		maxHeight = height/numLines; 
		// Figure out the width of the bars. Each row will have different sized
		// widths depending on the number of words in the line. 
		maxWidth = width/words.length;
		// Height rang initializer;
		heightRange = 0;
		// Find the height range by searching through each string in the words array and 
		// finding the longest word
		for(int i = 0; i < words.length; i++) {
			if(words[i].length() > heightRange) {
				heightRange = words[i].length(); 
			}
		}

	}

	public void display() {
		// Shows the bars

		// The base gradation increment for the fill, determined as a function
		// Of the number of bars that might appear on screen.
		float gradationIncrement = 200/words.length;
		// Initialize the first fill color
		float myFill = 50.0f; 
		//Loop through the line, create the bars
		for(int i = 0; i< words.length; i++){
			rectMode(CENTER);
			myFill = myFill + (gradationIncrement * i);
			pushMatrix();
			translate(maxWidth*i + maxWidth, curIndex * maxHeight);
			// Map the y Value the bar from 0 to the longest word TO a height value in the max height range.
			float yVal = map(words[i].length(), 0, heightRange, 0, maxHeight);
			fill(myFill);
			rect(0, yVal, maxWidth, maxHeight - yVal);
			popMatrix();
		}

	}

}

  public int sketchWidth() { return 600; }
  public int sketchHeight() { return 600; }
}
