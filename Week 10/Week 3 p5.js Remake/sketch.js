var grid = [200, 400, 600];
var xPos;
var yPos;
var xVelocity = 1;
var yVelocity = 1;

// booleans
let start = false;
let gridActive = false;

function setup(){
  createCanvas(600, 600);
  background(0);
  strokeWeight(2);
}

function draw(){
  background(0);
  stroke(255, 255, 255);
  for (let i = 0; i < grid.length; i++){
    line(grid[i], 0, grid[i], height);
    line(0, grid[i], width, grid[i]);
  }

  // if you started...
  if (start == true){
    noStroke();
    // ellipse(xPos, yPos, 200, 200); // tester to see if it's even working
    ellipse(xPos, yPos, 50, 50);

    // movement
    xPos += xVelocity;
    yPos += yVelocity;

    // boundaries (window)
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

function keyPressed(){
  if (key == ' '){
    gridActive = !gridActive;
  }
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
}

function mouseClicked(){
  start = !start;
  xPos = mouseX;
  yPos = mouseY;
}
