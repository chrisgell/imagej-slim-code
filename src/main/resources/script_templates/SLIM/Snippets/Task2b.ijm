//Code to extract regions from blobs
//You'll need to edit line 32 to save to a different path, or get it to ask you?

//check blobs is open, get the user to open it.
if (isOpen("blobs.gif") == 0) {
	waitForUser("Open the image blobs");		
}



selectWindow("blobs.gif");//Always need to make sure the intended window is top  
run("Duplicate...", "title=for_detection"); //duplicate it, will run analysis on this version

//delete any regions in the manager, need to check the ROI is not empty or returns error
if (roiManager("count") !=0) {
roiManager("deselect");
roiManager("delete");
}


selectWindow("for_detection");//Always need to make sure that this window is top  
run("Auto Threshold", "method=Default white"); //threshold it
run("Analyze Particles...", "size=0.00-3881949.67 circularity=0.00-1 show=Nothing exclude add"); //get objects
close();


//Going to duplicate out each ROI and then save it
for (i=0; i<45; i++) {
	selectWindow("blobs.gif");//Always need to make sure that this window is top     
	roiManager("select", i); //select the i'th ROI in the manager
	run("Duplicate...", "title=blobs-"+i+".gif");//pull out that ROI with a unique name
	saveAs("Tiff", "C:\\Users\\mbzcg1\\Desktop\\blobs"+i+".tif");;//save as a Tiff - EDIT THIS LINE
	close();//Close that last window
}

close();//tidy up
