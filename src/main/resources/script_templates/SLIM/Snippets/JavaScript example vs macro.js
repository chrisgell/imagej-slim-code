/*
Example of how more efficient scripting in, for example JavaScript, can be. 
(Although this really demonstrates the Script @Parameter aspect.)
4 lines of code essentially does the same job as 30 odd lines of (albeit not very well written) .ijm. 
*/



#@ ImagePlus mtImage
#@ ImagePlus gfpImage
 
print("The MT image is "+mtImage)
print("The GFP stream image is "+gfpImage)

/*
 * The corresponding macro code was
 *  //create an array with a list of open window names
 n = nImages; 
    list = newArray(n); 
    setBatchMode(true); 
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


// create a dialog to get the user to tell us which is which
title = "Choose GFP image";
width=1024; height=1024;
Dialog.create("Choose GFP image");
Dialog.addChoice("Type:", list);
Dialog.show();

gfpImageName = Dialog.getChoice();

print(gfpImageName);
print(mtImageName);

 */