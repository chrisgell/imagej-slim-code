//Chris Gell
//Jan 2018
//Colony Size Macro v1
//User needs to select a region
run("Duplicate...", " ");//Duplicates the image
run("Duplicate...", " ");//good to have a copy
run("Clear Outside"); //tidies up outside the area selected - makes life simpler later
run("8-bit"); //simple to set this to monochrome
run("Find Edges"); //highlights the edges
run("Gaussian Blur...", "sigma=1"); //a little blur makes thrhsolding easier
run("Auto Threshold", "method=Default white"); //threshold everything
run("Analyze Particles...", "size=50-Infinity circularity=0.4-1.00 show=Outlines display exclude clear summarize add"); //detect the objects