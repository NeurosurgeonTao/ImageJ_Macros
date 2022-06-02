title = getTitle();
selectWindow(title);
run("Duplicate...", " ");
run("Gaussian Blur...", "sigma=100");
new_title = title.substring(0, title.length-4)+"-1.tif"
imageCalculator("Subtract create", title, new_title);
result_name = "Result of "+title
selectImage(result_name);
//print(result_name);
//run("8-bit");
//run("Ridge Detection", "line_width=5 high_contrast=50 low_contrast=10 make_binary method_for_overlap_resolution=NONE sigma=1.94 lower_threshold=0.17 upper_threshold=0.85 minimum_line_length=5 maximum=0");
//run("Summarize Skeleton");
//run("Close All");