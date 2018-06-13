


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


//code to make kymos
selectWindow(mtImageName);
run("Multi Kymograph", "linewidth=3");
selectWindow("Kymograph");
rename(mtImageName+"-kymo");


/*
close();
selectWindow("Image 107-1.czi");
selectWindow("Image 108.czi");
run("Restore Selection");
run("Multi Kymograph", "linewidth=3");
selectWindow("Kymograph");
selectWindow("Kymograph");
run("Merge Channels...", "c1=Kymograph c2=Kymograph c6=Kymograph create keep");
close();
run("Merge Channels...", "c2=Kymograph c6=Kymograph create keep");



