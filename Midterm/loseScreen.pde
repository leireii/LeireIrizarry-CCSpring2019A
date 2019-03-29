void loseScreen(boolean right[], boolean user[]){
  boolean correct[] = right;
  boolean player[] = user;
  int x = 0;
  int y = 0;
  Tile tile = new Tile();
  
  for (int i = 0; i < 16; i++){
    if (x > 600) {
      x = 0;
      y = y + 200;
    }
    tile.drawSquare(correct[i], x, y, 255, 0, 255);
    tile.drawSquare(player[i], x, y, 255, 255, 0);
    x = x + 200;
  } 
  
}
