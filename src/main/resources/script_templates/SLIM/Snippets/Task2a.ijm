//Code to extract regions from blobs

//Check the ROIs are loaded.
if (roiManager("count") == 0) {

	waitForUser("Please load the ROI, clik ok when done.");		
}


//Going to duplicate out each ROI and then promt to save it
for (i=0; i<45; i++) {
	selectWindow("blobs.gif");//Always need to make sure that this window is top     
	roiManager("select", i); //select the i'th ROI in the manager
	run("Duplicate...", " ");//Duplicate out that region
	saveAs("tiff");//Prompt the user to save as a Tiff
	close();//Close that last window
}
