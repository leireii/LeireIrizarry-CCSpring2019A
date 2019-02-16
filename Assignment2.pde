/*
Author: Leire Irizarry
File: Assignment2.pde
Summary: A program that divides the screen into four sections, allowing the user to make art by dragging the mouse and changing the color of the shapes drawn.
Controls: 
          COLOR STARTS AS WHITE: (Red, Green, Blue) -> (255, 255, 255)
          Q -> increase red color value
          A -> decrease red color value
          W -> increase green color value
          S -> decrease green color value
          E -> increase blue color value
          D -> decrease blue color value
          LEFT-CLICK -> toggle drawing
*/
void setup() {
  // initial size and random background color
  size(1920, 1080);
  background(random(255), random(255), random(255));
}
// set global values
int redvalue = 255;
int greenvalue = 255;
int bluevalue = 255;
int opacity = 100;
boolean isClicked = false; // user can toggle if the brush is painting or not by clicking

void draw() {
  if (isClicked == true) {
    strokeWeight(1);
    // add mouse position changes
    fill(redvalue, greenvalue, bluevalue, opacity);
    noStroke();
    // top left
    if (mouseX <= width/2 && mouseY <= height/2) {
      noFill();
      stroke(redvalue, greenvalue, bluevalue);
      ellipse(mouseX, mouseY, 150, 150);
    // right
    }else if(mouseX >= width/2){
      if (mouseY >= height/2){ // bottom right
        opacity = 50;
        fill(redvalue, greenvalue, bluevalue, opacity);
        rect(mouseX, mouseY, 100, 100);
      }else{ // top right
        opacity = 20;
        noStroke();
        fill(redvalue, greenvalue, bluevalue, opacity);
        ellipse(mouseX, mouseY, 50, 100);
      }
    // bottom left
    }else{
      opacity = 70;
      fill(redvalue, greenvalue, bluevalue, opacity);
      triangle(mouseX, mouseY, mouseX - 50, mouseY - 50, mouseX + 50, mouseY - 50);
    }
  }
}
void mousePressed() {
  // make the toggle click work
    if (isClicked == true) {
      isClicked = false;
    } else {
      isClicked = true;
    }
  }

  void keyPressed() {
    // set color-changing key bindings
    if (key == 'Q' || key == 'q') {
      redvalue += 15;
    } else if (key == 'A' || key == 'a') {
      redvalue -= 15;
    }
    if (key == 'W' || key == 'w') {
      greenvalue += 15;
    } else if (key == 'S' || key == 's') {
      greenvalue -= 15;
    }
    if (key == 'E' || key == 'e') {
      bluevalue += 15;
    } else if (key == 'D' || key == 'd') {
      bluevalue -= 15;
    }
  }
