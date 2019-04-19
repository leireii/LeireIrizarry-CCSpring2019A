/*
Author: Leire Irizarry
Assignment: Week 11
Summary: Intended to be a simulation of a waterfall. Ended up looking more like sprinklers in a building.
*/

// shorthand
var Engine = Matter.Engine;
var World = Matter.World;
var Bodies = Matter.Bodies;
var Mouse = Matter.Mouse;
var MouseConstraint = Matter.MouseConstraint;

// engine & world
var engine = Engine.create();
var world = engine.world;

// containers
var circles = [];
var canvas;
var platforms = [];

function setup(){
  canvas = createCanvas(600, 300);
  background(180, 220, 255);
  
  // create 3 platforms at random positions
  for (let i = 0; i < 3; i++){
    platforms.push(new Bodies.rectangle(random(width), random(height), 125, 25, {isStatic: true}, {friction: 0}));
  }
  
  // add and run
  World.add(engine.world, platforms);

  Engine.run(engine);
}

function draw(){
  background(180, 220, 255);
  fill(145, 63, 33);
  noStroke();
  // draw the platforms
  for (let i = 0; i < platforms.length; i++){
    rect(platforms[i].position.x-60, platforms[i].position.y-15, 125, 25);
  }
  // draw the circles and check if not visible to remove circles
  for(let i = 0; i < circles.length; i++){
    if(circles[i].isGone()){
      World.remove(world, circles[i].body);
      circles.splice(i, 1);
      i = i - 1;
      console.log('done');
    }else{
      circles[i].display();
    }
  }
  // create new circles along the top of the canvas
  for (let i = 0; i < width; i = i + 50){
      circles.push(new Circle(i, 0, random(1, 3)));
  }
}
