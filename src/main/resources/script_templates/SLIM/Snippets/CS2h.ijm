


//Get a list of image names
     n = nImages; 
    list = newArray(n); 
    for (i=1; i<=n; i++) { 
        selectImage(i); 
        list[i-1] = getTitle; 
     
    } 


// create a dialog to get the user to tell us which is which
title = "Choose MT image";
width=1024; height=1024;
Dialog.create("Choose MT image");
Dialog.addChoice("Type:", list);
Dialog.show();
mtImageName = Dialog.getChoice();
print("You selected " + mtImageName);
    


title = "Choose GFP image";
width=1024; height=1024;
Dialog.create("Choose GFP image");
Dialog.addChoice("Type:", list);
Dialog.show();
gfpImageName = Dialog.getChoice();
print("You selected as the stream" + gfpImageName);
    
 //selectWindow("Image 107.czi");
selectWindow(mtImageName);     






 
 n=299;     
      run("Copy");

for (i=0; i<n; i++) {            
      run("Add Slice");
      run("Paste");
}


//code to make kymos for mt image
selectWindow(mtImageName); //select the correct window

roiManager("select", 0); //select the first ROI in the manager

run("Multi Kymograph", "linewidth=3");  
selectWindow("Kymograph");
rename(mtImageName+"-kymo");

//code to make kymos for gfp image
selectWindow(gfpImageName); //select the correct window

roiManager("select", 0); //select the first ROI in the manager

run("Multi Kymograph", "linewidth=3");  
selectWindow("Kymograph");
rename(gfpImageName+"-kymo");


//create strings to try to keep things simple
mtKymo="'"+mtImageName+"-kymo'";
gfpKymo="'"+gfpImageName+"-kymo'";
mrgString = "c2="+gfpKymo+" c6="+mtKymo+" create keep";

run("Merge Channels...", mrgString); //run the merge
rename(gfpImageName+mtImageName+"-kymo");

/*

run("Merge Channels...", "c2=Kymograph c6=Kymograph create keep");



