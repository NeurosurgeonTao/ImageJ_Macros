//microglial count
title = getTitle();
selectWindow(title);
run("Duplicate...", " ");
run("Gaussian Blur...", "sigma=500");
new_title = title.substring(0, title.length-4)+"-1.tif"
imageCalculator("Subtract create", title, new_title);
result_name = "Result of "+title
selectImage(result_name);
run("8-bit");
setAutoThreshold("Yen dark");
//setAutoThreshold("Default dark");
//setAutoThreshold("Default dark");
setOption("BlackBackground", true);
run("Convert to Mask");
run("Despeckle");
run("Despeckle");
run("Despeckle");
run("Analyze Particles...", "size=30-500 pixel exclude summarize");
run("Close All");