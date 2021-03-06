// Generic multiple colour co-localisation analysis macro
// Analyses a series of greyscale slices in a stack, each corresponding to a colour channel
// Expandable to any number of colour channels (slices)
// Provides number of pixels above threshold for each combination of colour channels
// Data provided is in bins corresponding to (for three channels):
// 
// Bin	Ch 1	Ch 2	Ch 3
// 0	-	-	-
// 1	+	-	-	
// 2	-	+	-
// 3	+	+	-
// 4	-	-	+
// 5	+	-	+
// 6	-	+	+
// 7	+	+	+


// Set threshold values for each colour channel (each slice)
// Add extra thresholds for more than 5 channels
Threshold = newArray(6);

Threshold[1] = 10;
Threshold[2] = 40;
Threshold[3] = 50;
Threshold[4] = 50
Threshold[5] = 50;

// Check for RGB image and convert to greyscale stack
// Where Ch 1 = red, Ch 2 = green, Ch 3 = blue
// Breaks if image name includes "(RGB)"
image = getImageID(); selectImage(image); info = getInfo(); 
if (indexOf(info, "(RGB)") >1) {
	run("RGB Split");
	run("Convert Images to Stack");
	exit("Draw your ROI and rerun the macro");}

stack = getImageID(); selectImage(stack); slices = nSlices();
results = newArray(pow(2, slices));
Greyscales = 255; if (indexOf(info, "pixel: 16")>1) {Greyscales = 65535;}
//run("Measure");

setBackgroundColor(0,0,0);
for (i =0; i<slices; i++) {
	selectImage(stack);
	slice = "slice="+(i+1);
	run("Set Slice...", slice); run("Clear Outside", "slice");
	changeValues(0,Threshold[i+1],0); changeValues((Threshold[i+1]+1),Greyscales,pow(2,i));}

run("Z Project...", "start=1 stop=5 projection='Sum Slices'"); sum = getImageID();
selectImage(stack);
selectImage(sum);
run("Restore Selection");

run("Histogram", "bins=" + pow(2,slices) + "  x_min=0 x_max=" + pow(2,slices));