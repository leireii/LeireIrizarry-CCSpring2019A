/*
Author: Leire Irizarry
WallDrawing164.pde
Instructions from GitHub:
    "title" : "Wall Drawing #164 (1973)"
    "description" : "A black outlined square with a red horizontal line 
    centered on the axis between the midpoint of the left side and the 
    midpoint of the right side and a red diagonal line centered on the axis 
    between the lower left and upper right corners."
*/

void setup(){
  size(800,800);
  background(250);
  
  // establish left and right point values (essentially lower left and upper right)
  int leftX = 200;
  int leftY = 600;
  int rightX = 600;
  int rightY = 200;
  
  // establish axis
  int axisY = 400;
  
  // set red line settings
  stroke(255, 0, 0);
  strokeWeight(10);
  
  // draw horizontal red line
  line(leftX, axisY, rightX, axisY);
  
  // draw vertical red line
  line(leftX, leftY, rightX, rightY);
  
  // establish black outline (stroke)
  stroke(0);
  strokeWeight(20);
  strokeCap(SQUARE);
  noFill();
  
  // draw square
  rect(leftX, rightY, 400, 400);
  

  
}
