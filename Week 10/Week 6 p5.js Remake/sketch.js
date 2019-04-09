// MAIN FILE Assignment_6 //

function setup(){
  let rain = Rain(200, 200);
  createCanvas(400, 400);
  background(0);
}

function draw(){
  background(100);
  drawScenery();
  drawCloud(mouseX, mouseY);
  rain.addDrop();
  rain.start();
}

// ***************************************** //

// Rain class //
class Rain {
  var raindrops = []*12;
  let position = createVector(200, 200);

  constructor(x, y){
    position.x = x;
    position.y = y;
  }

  // begin the actual raining
  start(){
    for(let i = 0; i < raindrops.length; i++){
      let raindrop = raindrops[i];
      raindrop.show();
      raindrop.move();

      if(raindrop.isDead()){
        raindrops.remove(i);
      }
    }
  }

  // add new raindrops to array
  addDrop() {
    raindrops.add(Raindrop(position.x, position.y));
  }
}

// ***************************************** //

// Raindrop clas //
class Raindrop {
  let vel;
  let spd;
  let position;

  var size = random(5, 10);
  var duration = 255;

  constructor(x, y){
    position = createVector(random(mouseX-30, mouseX+30), mouseY+28);
    spd = createVector(0, .1);
    vel = createVector(0, .1);
  }

  // methods
  move(){
    fall();
    show();
  }

  fall(){
    vel.add(spd);
    position.add(vel);
    duration -= 4;
  }

  show(){
    noStroke();
    fill(random(0,100), random(0, 255), 255, duration);
    circle(position.x, position.y, size);
  }

  isDead(){
    if (duration < 0){
      return true;
    }else{
      return false;
    }
  }
}

// ***************************************** //
// FUNCTIONS //

// drawCloud function //
drawCloud(x, y){
  let cloud = loadImage("cloud.png");
  imageMode(CENTER);
  image(cloud, x, y);
}

// drawScenery function //
drawScenery(){

  // grass
  noStroke();
  fill(49, 109, 49);
  rect(0, 350, 400, 50);

  // house
  fill(255, 252, 229);
  rect(30, 260, 100, 90);

  // roof
  fill(198, 58, 29);
  triangle(30, 260,
           80, 210,
           130, 260);
}
