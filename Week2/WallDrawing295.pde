 /*
 Author: Leire Irizarry
 WallDrawing295.pde
 GitHub Instructions:
    "title" : "Wall Drawing #295 (1976)",
    "description": "Six white geometric figures (outlines) superimposed on a black wall."
 */
 
 void setup(){
   size(800, 800);
   background(0);
   int circleSize = 600;
   int squareSize = 600;
   stroke(255);
   fill(255, 255, 255, 25);
   rectMode(CENTER);
   
   // draw shapes
   for (int i = 0; i < 3; i ++){
     ellipse(width/2, height/2, circleSize, circleSize);
     rect(width/2, height/2, squareSize, squareSize);
     circleSize -= 200;
     squareSize -= 200;
   }
   
 }
 
