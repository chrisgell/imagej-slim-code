


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
    
 //selectWindow("Image 107.czi");
selectWindow(mtImageName);     
 
 n=299;     
      run("Copy");

for (i=0; i<n; i++) {            
      run("Add Slice");
      run("Paste");
}
