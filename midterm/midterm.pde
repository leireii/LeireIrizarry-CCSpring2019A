/*
Author: Leire Irizarry
File: midterm.pde
This is a memory game. 
Instructions:
SPACE to start
CLICK to select a tile
X to play again
*/

boolean isStart;
boolean gameOver;
boolean correct[];
boolean player[];
boolean combined[];
int rand;
int opacity;
PImage title;
PImage winner;
PImage loser;

void setup() {
  
  // setup
  size(800, 800);
  background(0);
  
  // load images
  title = loadImage("titlescreen.png");
  winner = loadImage("winner.png");
  loser = loadImage("loser.png");
  
  // create lists
  correct = new boolean[16];
  player = new boolean[16];
  
  // set beginning values
  opacity = 255;
  isStart = false;
  gameOver = false;


  // create random correct list and empty player list
  for (int i = 0; i < 16; i++) {
    rand = int(random(0, 2));
    if (rand == 0) {
      correct[i] = true;
    } else {
      correct[i] = false;
    }
    player[i] = false;
  }
}


void draw() {
  // refresh background
  background(0);

  // text settings
  textAlign(CENTER);
  textSize(70);

  // if gameOver is true
  if (gameOver) {
    clear();
    loseScreen(correct, player);
    fill(255);
    rect(200, 270, 400, 200);
    image(loser, 195, 275);
    
    // if not gameOver
  } else if (gameOver == false) {
    // display instructions to start
    if (isStart == false) {
      image(title, 0, 0);
      //fill(255);
      //text("Press SPACE to start", width/2, height/3);
      //text("Remember the pattern!", width/2, height * 2 / 3);
    }

    // check if game is started
    else if (isStart == true) {
      drawOGGrid(correct, opacity, 255, 0); // draw original grid
      opacity -= 5;
      if (opacity < 5) {
        drawPlayerGrid(player); // when it fades, show player grid
      }

      // check if game won
      boolean checkWin = checkWin(correct, player); 
      if (checkWin) {
        clear();
        opacity = 255;
        drawOGGrid(correct, opacity, 0, 255);
        fill(255);
        rect(200, 270, 400, 200);
        image(winner, 195, 275);
      }
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    isStart = true; // begin game
  }
  if (key == 'x' || key == 'X') { // restart game
    isStart = false;
    gameOver = false;
    clear();
    setup();
  }
}

void mouseClicked() {
  int count = 0;

  // check for the click x value
  if (200 < mouseX && mouseX < 400) {
    count += 1;
  } else if (400 < mouseX && mouseX < 600) {
    count += 2;
  } else if (600 < mouseX) {
    count += 3;
  }

  // check for the click y value
  if (200 < mouseY && mouseY < 400) {
    count += 4;
  } else if (400 < mouseY && mouseY < 600) {
    count += 8;
  } else if (600 < mouseY) {
    count += 12;
  }
  
  // update list to show selected tile
  if (player[count] == false) {
    player[count] = true;
  }

  // check to see if the player screwed up
  boolean checkMatch = checkMatch(correct, player, count);
  if (checkMatch == false) {
    gameOver = true;
  }
}
