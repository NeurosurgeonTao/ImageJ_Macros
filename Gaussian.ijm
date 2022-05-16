title = getTitle();
selectWindow(title);
run("Duplicate...", " ");
run("Gaussian Blur...", "sigma=50");
new_title = title.substring(0, title.length-4)+"-1.tif"
imageCalculator("Subtract create", title, new_title);
result_name = "Result of "+title
selectImage(result_name);
//print(result_name);
//run("Close All");
