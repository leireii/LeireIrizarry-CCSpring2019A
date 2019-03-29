
public void drawOGGrid(boolean list[], int opacity, int r, int g) {
  int x = 0;
  int y = 0;
  boolean correct[] = list;

  Tile tile = new Tile();

  stroke(255);

  for (int i = 0; i < 16; i++) {
    if (x > 600) {
      x = 0;
      y = y + 200;
    }
    tile.drawSquare(correct[i], x, y, opacity, r, g);
    x = x + 200;
  }
}
