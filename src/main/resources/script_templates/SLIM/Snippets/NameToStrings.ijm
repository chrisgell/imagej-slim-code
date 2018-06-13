//Names of 'things' cdan be in string variables and can then be used in functions

run("Boats (356K)");	//Open the sample images boats and bridge
run("Bridge (174K)");


selectWindow("bridge.gif");	//Select and colour bridge green
run("Green");

myImageName = "boats.gif";	//creating a string that refers to an object (image, directory, command) is very powerful
selectWindow(myImageName);	//Select and colour boats red
run("Red");
