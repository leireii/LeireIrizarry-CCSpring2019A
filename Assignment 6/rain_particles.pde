Rain rain = new Rain(200, 200);
void setup(){
  background(100);
  size(400, 400);
}

void draw(){
  background(100);
  drawScenery();
  drawCloud(mouseX, mouseY);
  rain.addDrop();
  rain.start();
}
