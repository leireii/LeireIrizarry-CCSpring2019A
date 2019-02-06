/*
  Author: Leire Irizarry
  File Name: LeireIrizarry_Week1.pde
  
  This is for the Week 1 assignment for Creative Coding Spring 2019 to recreate an art piece
  using Processing.
  
  The piece I recreated is "Abstrato Geometrico No. 2.2" by Samson Flexor (1954).
*/

void setup(){
  size(670, 800);
  stroke(0, 0, 0, 0); // because I don't want any borders

  // exciting beige background
  background(245, 234, 202);
  
  // light gray L
  fill(230, 239, 244);
  rect(220, 400, 100, 142);
  rect(220, 485, 240, 65);
  
  // dark blue line in bottom of shape
  fill(3, 24, 35);
  beginShape();
    vertex(200, 400); // blue triangle has 200 as bottom left corner
    vertex(220, 400);
    vertex(220, 542); // several shapes have 220 as top left corner
    vertex(460, 542);
    vertex(500, 572);
    vertex(200, 572);
  endShape(CLOSE);
  
  // blue-ish rectangle on top
  fill(18, 107, 110);
  rect(220, 200, 170, 100); // 220 is x of where the greenish shape starts
  
  // gray-ish teal rectangle
  fill(151, 199,195);
  rect(220, 325, 100, 75);
  
  // light triangle that's actually just gonna be a rectangle
  fill(200, 229, 225);
  rect(259, 230, 110, 100); // 259 is x of green shape's vertical line
  
  // purple-ish shape (triangle and rectangle)
  fill(192, 186, 199);
  triangle(255, 230, 
           450, 230, 
           440, 390);
  rect(370, 180, 140, 145);
  
  // triangle on top of blue rectangle
  fill(108, 172, 183);
  triangle(252, 237, 
           252, 300, 
           200, 300);
  
  // almost black shape on left
  fill(4, 15, 33);
  rect(270, 340, 100, 80);
  
  // green shape with sharp protrusion
  fill(79, 163, 133);
  triangle(220, 325, 
           400, 325, 
           320, 400);
  rect(279, 325, 70, 160);
  
    
  // huge right triangle
  fill(83, 155, 148);
  triangle(450, 230,
           450, 480,
           280, 480);
  
  // almost black backwards L
  fill(4, 15, 33);
  rect(340, 400, 60, 15);
  rect(382, 325, 18, 80);
  
  // i'm starting to run out of ways to describe these shapes

  // slightly lighter triangles on bottom of the mess
  fill(180, 230, 208);
  triangle(320, 410,
           380, 485,
           320, 485);
           
    // larger triangle
  triangle(340, 380,
           340, 485,
           273, 485);
  
  // dark red square
  fill(70, 30, 39);
  rect(300, 340, 70, 60);
  
  // yellow backwards L
  fill(234, 224, 111);
  rect(340, 375, 40, 25);
  rect(360, 315, 22, 85);
  

}

void draw(){
}
