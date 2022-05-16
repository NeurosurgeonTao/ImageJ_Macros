title = getTitle();
run("Split Channels");

//Red channel
selectWindow(title+" (red)");

//run("RATS ", "noise=25 lambda=3 min=81 verbose")
run("Robust Automatic Threshold Selection", "noise=25 lambda=3 min=205");

//setAutoThreshold("Default dark");
//setAutoThreshold("Default dark");
//setOption("BlackBackground", true);
//run("Convert to Mask");

short_title = title.substring(0, title.length - 4);
red_pic = short_title+"-mask";
selectWindow(red_pic);

//run("Despeckle");
//run("Despeckle");

run("Watershed");
run("Analyze Particles...", "size=20-Infinity pixel display exclude summarize add in_situ");


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

//print(red_pic);
//print(short_title);

imageCalculator("AND create", green_pic, red_pic);
selectWindow("Result of "+green_pic);
run("Analyze Particles...", "size=5-Infinity pixel display exclude summarize add");
run("Close All");