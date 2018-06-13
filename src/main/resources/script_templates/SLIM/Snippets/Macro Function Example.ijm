//Shows how a function can make code more efficienct.

run("Leaf (36K)");
run("Dot Blot (7K)");

 var height;
 var width;
 var title="";

/*
 * Lots of code
 */

getImageSizeByTitle("leaf.jpg");

print("The height of "+title+" is "+height);
print("The width of "+title+" is "+width);

/*
 * Lots of other code
 */

getImageSizeByTitle("Dot_Blot.jpg");


print("The height of "+title+" is "+height);
print("The width of "+title+" is "+width);

/*
 * Lots of other code
 */

function getImageSizeByTitle(argumentPassedToFunction) {
        selectWindow(argumentPassedToFunction);
        width=getWidth();
        height=getHeight();
        title=argumentPassedToFunction
        return width, height, title
}