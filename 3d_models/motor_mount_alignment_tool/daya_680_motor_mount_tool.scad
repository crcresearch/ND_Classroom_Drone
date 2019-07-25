// Motor Mount Alignment Tool for Daya 680 Drone Frame

bodyLength = 35.0;
bodyWidth = 30.0;
bodyHeight = 34.3;

shaftOffset = 20.1;

shaftDiameter = 16.2;
shaftLength = 30.0;

slotLength = 5.3;
slotWidth = bodyWidth;
slotHeight = 31.0;

slot1Offset = shaftLength - slotLength;
slot2Offset = slot1Offset-13.8-slotLength;

textSize = 4.0;
textDepth = 1.5;
textXOffset = 2;
textYOffset = 2;
textLineSpacing = textSize+2;
textLine1 = "Daya 680";
textLine2 = "Motor Mount";
textLine3 = "Alignment";
textLine4 = "Tool";

smoothness = 80;


difference() {
	// Main body of the tool
	cube([bodyLength, bodyWidth, bodyHeight]);

	// Cutout for the frame tube
	translate([0,bodyWidth/2, bodyHeight-shaftOffset])
		rotate([0,90,0])
			cylinder(d=shaftDiameter, h=shaftLength, $fn=smoothness);
	translate([0,bodyWidth/2-shaftDiameter/2,bodyHeight-shaftOffset])
		cube([shaftLength, shaftDiameter, bodyHeight]);

	// Slots for the mounting brackets
	translate([slot1Offset,0,bodyHeight-slotHeight])
		createSlot();
	translate([slot2Offset,0,bodyHeight-slotHeight])
		createSlot();

	addText(textLine1, textXOffset, textYOffset+textLineSpacing*0);
	addText(textLine2, textXOffset, textYOffset+textLineSpacing*1);
	addText(textLine3, textXOffset, textYOffset+textLineSpacing*2);
	addText(textLine4, textXOffset, textYOffset+textLineSpacing*3);
}

module createSlot() {
	cube([slotLength, slotWidth, slotHeight]);
}

module addText(text, XOffset, YOffset) {
    linear_extrude(textDepth)
		translate([XOffset,YOffset+textSize,0])
		rotate([180,0,0])
        text(text, size = textSize);
}
