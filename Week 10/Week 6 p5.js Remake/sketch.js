let rain;
let raindrops = [];
let canvas;


function setup(){
  canvas = createCanvas(400, 400);
  background(100);
  rain = new Rain(200, 200);
}

function draw(){
  background(100);
  drawScenery();
  let x = mouseX;
  let y = mouseY;
  rain.addDrop();
  rain.start();
  drawCloud(x, y);
}



// Raindrop class
class Raindrop {

  constructor(x, y){

    this.size = random(5,10);
    this.duration = 255;


    this.position = createVector(random(mouseX-30, mouseX+30), mouseY+28);
    this.spd = createVector(0, .1);
    this.vel = createVector(0, .1);
  }

  move(){
    this.fall();
    this.show();
  }

  fall(){
    this.vel.add(this.spd);
    this.position.add(this.vel);
    this.duration -= 4;
  }

  show(){
    noStroke();
    fill(random(0, 100), random(0, 255), 255, this.duration);
    circle(this.position.x, this.position.y, this.size);
  }

  isDead(){
    if (this.duration < 0){
      return true;
    }else{
      return false;
    }
  }
}

// Rain class
class Rain {

  constructor(x, y) {

    this.position = createVector(200, 200);
    this.position.x = x;
    this.position.y = y;
  }

  addDrop(){
    raindrops.push(new Raindrop(this.position.x, this.position.y));
  }

  start(){
    for (let i = 0; i < raindrops.length; i++){
      let raindrop = raindrops[i];
      raindrop.show();
      raindrop.move();

      if (raindrop.isDead()){
        raindrops.splice(i, 1);
      }
    }
  }
}


// drawScenery


function drawScenery(){
  noStroke();
  fill(49, 109, 49);
  rect(0, 350, width, 50);

  fill(255, 252, 229);
  rect(30, 260, 100, 90);

  fill(198, 58, 29);
  triangle(30, 260,
         80, 210,
         130, 260);
}

function drawCloud(x, y){
  fill(230);
  ellipse(x - 10, y + 10, 70, 40);
  ellipse(x + 10, y + 10, 70, 40);
  circle(x - 15, y, 20);
  circle(x + 15, y, 20);
  ellipse(x, y, 50, 50);

}
