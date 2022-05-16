fn = getTitle()

run("Split Channels");

close();

setAutoThreshold("Default dark");
//run("Threshold...");
//setThreshold(46, 255);
setOption("BlackBackground", true);
run("Convert to Mask");

run("Despeckle");
run("Despeckle");
run("Despeckle");

setAutoThreshold("Default dark");
//run("Threshold...");
//setThreshold(46, 255);
run("Convert to Mask");


run("Analyze Particles...", "size=100-Infinity pixel display exclude summarize add in_situ");

selectWindow("0921 S7d 30um-5_TileScan 1_ICC_s048.tif (red)");


makeRectangle(666, 222, 137, 277);
makeRectangle(666, 222, 137, 277);
roiManager("Show All without labels");
roiManager("Show None");
run("Analyze Particles...", "size=50-Infinity pixel display exclude summarize add");
roiManager("Show None");
selectWindow("0921 S7d 30um-5_TileScan 1_ICC_s048.tif (green)");
roiManager("Show All");
roiManager("Show None");
roiManager("Show All");
roiManager("Show None");
selectWindow("0921 S7d 30um-5_TileScan 1_ICC_s048.tif (red)");
roiManager("Show All");
roiManager("Show None");
roiManager("Show All with labels");
roiManager("Show All without labels");
roiManager("Show All with labels");
roiManager("Show All without labels");
roiManager("Show All with labels");
roiManager("Show All without labels");
roiManager("Show All with labels");
roiManager("Show All without labels");
roiManager("Show All with labels");
roiManager("Show All without labels");
imageCalculator("AND create", "0921 S7d 30um-5_TileScan 1_ICC_s048.tif (green)","0921 S7d 30um-5_TileScan 1_ICC_s048.tif (red)");
selectWindow("Result of 0921 S7d 30um-5_TileScan 1_ICC_s048.tif (green)");
run("Analyze Particles...", "size=0-Infinity pixel display exclude summarize add");
