// Chris Gell
//November 2017
//v2 20171201



//Macro to partially automate MT depoly rate calculations.

//load a data set, set the thrshold, then choose a FOV to choos MTs.

//Prompt for time label
timeLabel=getNumber("Enter the time spacing in seconds", 5)


//clear the ROI manager
if (roiManager("count") !=0)  {
roiManager("deselect");
roiManager("delete");
}



//clear any results
run("Clear Results");



//configure set measurments
run("Set Measurements...", "fit redirect=None decimal=3");

// pre process 
run("Gaussian Blur...", "sigma=2 stack");

//threshold it
run("Threshold...");
setOption("BlackBackground", false);

//wait for the user
waitForUser( "Pause","Please set the threshold (apply it, click ok), click OK.");


//bring threshold to front

   if (isOpen("Threshold")) {
        selectWindow("Threshold");  // bring to front 
       
   }
    

//wait for the user
waitForUser( "Pause","Choose a frame that will be used to detect and set MT ROIs, click OK.");
    
        
//detect where tubes are
run("Analyze Particles...", "  circularity=0.00-0.50 show=Outlines exclude add");
run("Close");


//enlarge these ROIs to give a little error tolerence
counts=roiManager("count");
for(i=0; i<counts; i++) {
    roiManager("Select", i);
    run("Enlarge...", "enlarge=1");
    roiManager("Update");
}


//manually go through the ROIs, delete any spurious, add any new, move any off...
waitForUser( "Pause","Please sedit the ROIs as necessary"); 


//dir to save data
dir = getDirectory("Choose a Directory ");


//Prompt for time label
circFactor=getNumber("Enter the circulatiry parameter", 0.5);
partAnal="size=0-100000  circularity=0.00-"+circFactor+" show=Outlines display exclude stack";



//for all MTs
counts=roiManager("count");

for(j=0; j<counts; j++) {
    roiManager("Select", j);
    

//do the analysis for this tube
run("Analyze Particles...", partAnal);
run("Close");

////////////////////////////////////////////////////////
//Saving the results 

//have to do some tricks here as ROIs are included in nResults (it seems).
numROI = roiManager("count");
//print(numROI);

numRes = nResults;
//print(numRes);

//deal with the fact that some results already exist after the first excution, but not after the second.
//could of dealt with htis better, clear results for example.
if (j==0) {
numMTRes = numRes-numROI;
} else {
numMTRes=numRes;
}

 n = numMTRes; 
    MTlength = newArray(n);
    //timeLabel = 5;
    timeLabels = newArray(n);
 

//deal with fact results already exist, as above   
if (j==0) {
count=numROI;
} else {
count=0;
}

    timeCount=0;
    for (k=1; k<=n; k++) { 
        MTlength[k-1] = getResult("Major", count);
        
        timeLabels[k-1] = timeCount;
        timeCount+=timeLabel;
        count++; 
    } 
//close the results of the calc
   if (isOpen("Results")) { 
       selectWindow("Results"); 
      run("Close"); 
   } 

   //MTlength +"MT"+j+1 = MTLength;
   

   Array.show("Results"+"MT"+j+1, timeLabels, MTlength);
   selectWindow("Results"+"MT"+j+1); 


   saveAs("results"+"MT"+j+1, dir+"Results"+"MT"+j+1+".txt");

   //close the changed results
   if (isOpen("Results"+"MT"+j+1+".txt")) { 
       selectWindow("Results"+"MT"+j+1+".txt"); 
       run("Close"); 
   } 

}

