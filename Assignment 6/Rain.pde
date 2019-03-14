class Rain{
  ArrayList<Raindrop> raindrops = new ArrayList<Raindrop>();
  PVector position = new PVector(200, 200);
  
  public Rain(){
  }
  
  public Rain(float x, float y){
    position.x = x;
    position.y = y;
  }
  
  public void start(){
    for (int i = 0; i < raindrops.size(); i++){
      Raindrop raindrop = raindrops.get(i);
      raindrop.show();
      raindrop.move();
      if (raindrop.isDead()){
        raindrops.remove(i);
      }
    }
  }
  
  public void addDrop(){
    raindrops.add(new Raindrop(position.x, position.y)); 
  }
}
