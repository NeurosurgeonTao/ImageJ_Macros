//images order : specific staining before DAPI
//adjust the size of nuclei according to the cell type and the magnification

rep=getDirectory("Choose a folder");
Dialog.create("Parameters");
Dialog.addMessage("What is stained ?")
Dialog.addString("staining :", "XXX")
Dialog.addMessage("Choose a staining threshold :")
Dialog.addNumber("staining threshold :", 10);
Dialog.addMessage("Choose size limits of nuclei :")
Dialog.addNumber("lower :", 300);
Dialog.addNumber("higher :", 3000);
Dialog.show();
S=Dialog.getString();
ST=Dialog.getNumber();
L=Dialog.getNumber();
H=Dialog.getNumber();
list=getFileList(rep);
run("Set Measurements...", "  redirect=None decimal=2");
setBackgroundColor(255, 255, 255);
for(i=0;i<list.length;i=i+2)
{
nom=list[i+1];
open(rep+nom);
run("Duplicate...", "title=DAPI#"+(i+2)/2);
selectWindow(nom);
close();
run("8-bit");
run("Subtract Background...", "rolling=50");
run("Auto Threshold...", "method=Huang");
run("Make Binary");
run("Watershed");
//saveAs("TIFF", rep+"DAPI#"+(i+2)/2);
rename("DAPI#"+(i+2)/2);
run("Set Scale...", "distance=0 known=0 pixel=1 unit=pixel");
run("Analyze Particles...", "size=L-H pixel circularity=0.70-1.00 show=Nothing display exclude clear summarize");
nom=list[i];
open(rep+nom);
run("Duplicate...", "title=CELLS#"+(i+2)/2);
selectWindow(nom);
close();
selectWindow("CELLS#"+(i+2)/2);
run("8-bit");
run("Subtract Background...", "rolling=50");
setAutoThreshold("Huang dark");
setThreshold(ST, 255);
setOption("BlackBackground", false);
run("Make Binary");
run("Dilate");
run("Close-");
run("Fill Holes");
//saveAs("TIFF", rep+"CELLS#"+(i+2)/2);
rename("CELLS#"+(i+2)/2);
imageCalculator("AND create", "CELLS#"+(i+2)/2,"DAPI#"+(i+2)/2);
selectWindow("Result of CELLS#"+(i+2)/2);
rename(S+"#"+(i+2)/2+"--"+nom);
//saveAs("TIFF", rep+S+"#"+(i+2)/2+" - "+nom);
run("Set Scale...", "distance=0 known=0 pixel=1 unit=pixel");
run("Analyze Particles...", "size=L-H pixel circularity=0.70-1.00 show=Nothing display exclude clear summarize");
run("Close All");
}
selectWindow("Summary");
saveAs("Text", rep+"QuantIF ImageJ.xls");
selectWindow("QuantIF ImageJ.xls");
run("Close");
selectWindow("Results");
run("Close");
