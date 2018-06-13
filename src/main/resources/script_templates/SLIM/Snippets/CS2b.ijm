 //selectWindow("Image 107.czi");


//Get a list of image names
     n = nImages; 
    list = newArray(n); 
    for (i=1; i<=n; i++) { 
        selectImage(i); 
        list[i-1] = getTitle; 
     
    } 
    
 /*
 n=299;     
      run("Copy");

for (i=0; i<n; i++) {            
      run("Add Slice");
      run("Paste");
}
*/