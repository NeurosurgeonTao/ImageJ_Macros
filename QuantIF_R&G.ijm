title = getTitle();
run("Split Channels");

//Red channel
selectWindow(title+" (red)");

//run("RATS ", "noise=25 lambda=3 min=81 verbose")
//run("Robust Automatic Threshold Selection", "noise=25 lambda=3 min=205");
//.tif -> -mask

setAutoThreshold("Default dark");
setAutoThreshold("Default dark");
setOption("BlackBackground", true);
run("Convert to Mask");
run("Despeckle");
run("Despeckle");
run("Despeckle");
run("Analyze Particles...", "size=50-Infinity pixel display exclude summarize add in_situ");


//Green channel
selectWindow(title+" (green)");
setAutoThreshold("Default dark");
setAutoThreshold("Default dark");
setOption("BlackBackground", true);
run("Convert to Mask");
run("Despeckle");
run("Despeckle");
run("Despeckle");
run("Analyze Particles...", "size=100-Infinity pixel display exclude summarize add in_situ");

//Green & Red & Particle Analysis
green_pic = title+" (green)";
red_pic = title+" (red)";
imageCalculator("AND create", green_pic, red_pic);
selectWindow("Result of "+green_pic);
run("Analyze Particles...", "size=0-Infinity pixel display exclude summarize add");
run("Close All");