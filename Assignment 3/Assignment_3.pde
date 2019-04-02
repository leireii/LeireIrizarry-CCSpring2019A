/*
Author: Leire Irizarry
Assignment3Motion.pde
Summary: This program involves a ball that bounces and changes color.
Instruction: Use WASD keys to change vertical and horizontal velocity.
             CLICK to place ball.
             Press SPACE to toggle grid bounce.
*/

int []grid = {200, 400, 600};
int xPos;
int yPos;
int xVelocity;
int yVelocity;
boolean start = false;
boolean gridActive = false;

void setup(){
  size(600, 600);
  background(0);
  strokeWeight(2);
}

void draw(){
  background(0);
  stroke(255, 255, 255);
  for (int i:grid){
    line(i, 0, i, height);
    line(0, i, width, i);
  }
  
  if(start){
    noStroke();
    ellipse(xPos, yPos, 50, 50);
    xPos += xVelocity;
    yPos += yVelocity;
    // set boundaries
    if (xPos > width - 25 || xPos < 25){
      xVelocity *= -1;
    }
    if (yPos > height - 25 || yPos < 25){
      yVelocity *= -1;
    }
    
    // grid
    if(gridActive){ // if space is pressed, toggles whether grid boundaries are active
    // check vertical lines
       if ((xPos >= 175 && xPos <= 225) ||
       (xPos >= 375 && xPos <= 425) || 
       xPos >= 575){
          xVelocity *= -1;
          fill(random(255), random(255), random(255));
      }
      if((yPos >= 175 && yPos <= 225) || (yPos >= 375 && yPos <= 425)){
        yVelocity *= -1;
        fill(random(255), random(255), random(255));
      }
    
    }
        

  }
}
 
void mouseClicked(){
  start = !start;
  xPos = mouseX;
  yPos = mouseY;
  
}

void keyPressed(){
  if (key == 'w' || key == 'W'){
    yVelocity -= 1;
  }
  if (key == 's' || key == 'S'){
    yVelocity += 1;
  }
  if (key == 'a' || key == 'A'){
    xVelocity -= 1;
  }
  if (key == 'd' || key == 'D'){
    xVelocity += 1; 
  }
  if (key == ' '){
    gridActive = !gridActive;
  }
}
