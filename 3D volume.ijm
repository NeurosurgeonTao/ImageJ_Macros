dir = getDir("Choose a Directory") ;
folder = File.getName(dir);

File.openSequence(dir, "virtual filter=C003");
//mitochondria in Channel002 or Channel003;

run("8-bit");
run("Sharpen", "stack");
run("Despeckle", "stack");
run("Despeckle", "stack");

run("3D Objects Counter");
//可以调整threshold;
//run("3D Objects Counter", "threshold=14 slice=12 min.=10 max.=25165824 
//exclude_objects_on_edges objects surfaces centroids centres_of_masses statistics summary");

run("Close All");
//saveAs("results", dir + "/" + folder + ".csv");