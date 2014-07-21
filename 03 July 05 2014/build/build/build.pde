import controlP5.*; 
ControlP5 cp5;
IpSetup[] ipList;

int numControllers;

void setup() {
	size(600,600);
	background(0);
	cp5 = new ControlP5(this);
	numControllers = 0; 
	ipList = new IpSetup[0];
	ipList[0] = new IpSetup(0);
	// Get that new button
	cp5.addBang("Add New")
		.setPosition(125, 20)
		;
}

void draw() {
	background(0);
}

class IpSetup {
	// Index, will help us figure out which control set this belongs to
	int pIndex;
	// Constructor
	IpSetup(int pIndex_) {
		// Secure the Index
		pIndex = pIndex_;
		// Update numControllers
		numControllers++; 
		// Create the controls. 
		String hostIP = str(pIndex)+"_HostIP";
		// IP Address
		cp5.addTextfield(hostIP)
			.setPosition(20,20*(pIndex+1))
			.setSize(100,25)
			.setText("IP Address")
			;
		// Outgoing port
		cp5.addTextfield(pIndex+"_OutPort")
			.setPosition(20,(20*(pIndex+2)+35))
			.setSize(70,25)
			.setText("Outgoing Port")
			;
		cp5.addTextfield(pIndex+"_InPort")
			.setPosition(20,(20*(pIndex+3))+70)
			.setSize(70,25)
			.setText("Incoming Port")
			;
	}

};

void controlEvent(ControlEvent theEvent) {
	if(theEvent.isController()) {
		print("Event from "+theEvent.controller().name()+" with value "+theEvent.controller().value());

		// Check for bang. 
		if(theEvent.controller().name().equals("Add New")) {
			append(ipList, new IpSetup(ipList.length+1));
		}
	}
}