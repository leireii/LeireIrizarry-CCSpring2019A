void drawPlayerGrid(boolean list[]){
  boolean player[] = list;
  int x = 0;
  int y = 0;
  Tile tile = new Tile();
  
  // loop to draw grid
  for (int i = 0; i < 16; i++){
    if (x > 600) {
      x = 0;
      y = y + 200;
    }
    tile.drawSquare(player[i], x, y, 255, 255, 0);
    x = x + 200;
  }
}
