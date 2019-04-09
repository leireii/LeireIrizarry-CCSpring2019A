/*
Author: Leire Irizarry
cat_sketch.pde
Assignment # 5
INSTRUCTIONS:
  m -> mad emotion
  h -> happy emotion
  n -> default emotion (normal)
  LEFT & RIGHT ARROWS -> move tail

*/

Cat cat = new Cat();
boolean isMad = false;
boolean isHappy = false;
boolean isNormal = true;
float tailX = 250;
float tailMultiplier = 1;


void setup(){
  size(1000, 800);
  background(0);
}

void draw(){
  if (isHappy){
    colorMode(HSB, 360, 95, 100);
    background(map(tailX, 210, 790, 0, 360), 50, 100);
  }else{
    background(0);
  }
  colorMode(RGB, 255, 255, 255);
  cat.drawTail(tailX);
  fill(200);
  cat.drawFace();
  
  // draw emotions
  if (isMad){
    cat.drawEars('m');
    cat.drawMouth('m');
    cat.drawEyes('m');
  }
  else if (isHappy) {
    cat.drawEars('n');
    cat.drawMouth('h');
    cat.drawEyes('h');
  }
  else if (isNormal) {
    cat.drawEars('n');
    cat.drawMouth('n');
    cat.drawEyes('n');
  }
  
}

void keyPressed(){
  if (key == 'm'){
    isMad = true;
    isHappy = false;
    isNormal = false;
    tailMultiplier = 3;
  }
  if (key == 'h'){
    isHappy = true;
    isNormal = false;
    isMad = false;
    tailMultiplier = 2;
  }
  if (key == 'n'){
    isNormal = true;
    isHappy = false;
    isMad = false;
  }
  if (keyCode == LEFT && tailX > 200){
    tailX -= 10 * tailMultiplier;
  }
  if (keyCode == RIGHT && tailX < 800){
    tailX += 10 * tailMultiplier;
  }
}
