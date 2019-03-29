class Tile{
  
  public int x;
  public int y;
  
  public Tile(){
  }
  
  void drawSquare(boolean active, int x, int y, int opacity, int r, int g){
    stroke(255);
    if (active){
      fill(r, g, 0, opacity);
    }else{
      fill(0, 0, 0, 0);
    }
    rect(x, y, 200, 200);
  }
  
}
