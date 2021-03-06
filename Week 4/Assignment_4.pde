/*
Author: Leire Irizarry
Assignment_4.pde
Summary: This is essentially a loading screen with repetitive square shapes rotating endlessly.
         There is user input/interaction which allows the user to explore the interaction
         between Red, Green, and Blue values.
Controls: R/r --> toggle red square
          G/g --> toggle green square
          B/b --> toggle blue square
          * note: the opacity of each square is randomized each time the square is toggled
          SPACE --> toggle background color (black or white)
*/

// float information for initial angles
float sinmov;
float angle2 = 2.0;
float angle3 = 5.0;

// int information for opacity and red square size
int r;
int opacityr;
int opacityg;
int opacityb;

// set up booleans
boolean isShrink = false;
boolean redActive = false;
boolean blueActive = false;
boolean greenActive = false;
boolean isWhite = false;

// loading message
String message = "Loading...";

void setup(){
  background(0);
  frameRate(20);
  size(800, 800);
  rectMode(CENTER);

}

void draw(){
  // set up background color if statement
  colorMode(RGB);
  if(isWhite){
    background(360);
  }else{
    background(0);
  }
  
  // write "Loading..." and change its color according to HSB
  colorMode(HSB, 360, 100, 100);
  fill(angle3 % 360, 100, 100);
  textAlign(CENTER);
  textSize(40);
  text(message, width/2, height-100);
  
  colorMode(RGB);
  
  // draw blue square
  
  // MOVEMENT SIN WAVE
  // f(x) = Amplitude * sin( 2pi * frequency * x)
  sinmov = map(sin(r), -1, 1, height/3, 2 * height/3);
  println(sin(r * 2));
  
  if(blueActive){
    stroke(0, 0, 255);
    fill(0, 0, 255, opacityb);
    rect(map(r, 0, 250, width/3, 2 * width/3), sinmov, 100, 100);
    
  }
  
  // draw red square
  if(redActive){
    stroke(255, 0, 0);
    fill(255, 0, 0, opacityr);
    
    pushMatrix();
      translate(width/2, height/2);
      rotate(1*radians(angle2));
      rect(0, 0, r, r);
    popMatrix();
    
  }
    
  // draw green square
  if(greenActive){
    stroke(0, 255, 0);
    fill(0, 255, 0, opacityg);
    
    pushMatrix();
      translate(width/2, height/2);
      rotate(0.5*radians(angle3));
      rect(0, 0, 200, 200);
    popMatrix();
    
  }
  
  // set up boundaries for red square size changes
  if (r == 0){
    isShrink = false;
  }else if (r == 250){
    isShrink = true;
  }
  
  if (isShrink){
    r -= 1;
  }else{
    r += 1;
  }
  
  //increment angles
  angle2 += 1.0;
  angle3 += .8;

}

void keyPressed(){
  // set activators
  if (key == 'r' || key == 'R'){
    redActive = !redActive;
    opacityr = (int)random(255);
  }
  if (key == 'b' || key == 'B'){
    blueActive = !blueActive;
    opacityb = (int)random(255);
  }
  if (key == 'g' || key == 'G'){
    greenActive = !greenActive;
    opacityg = (int)random(255);
  }
  
  // if space is pressed, toggle background color
  if (key == ' '){
    isWhite = !isWhite;
  }
}
