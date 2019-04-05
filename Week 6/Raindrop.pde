class Raindrop{
  PVector vel;
  PVector spd;
  PVector position;
  
  public float size = random(5, 10);
  public float duration = 255;
  
  // constructors
  public Raindrop(){
  }
  
  public Raindrop(float x, float y){
    position = new PVector(random(mouseX-30, mouseX+30), mouseY+28);
    spd = new PVector(0, .1);
    vel = new PVector(0, .1);
    
  }
  
  void move(){
    fall();
    show();
  }
  
  void fall(){
    vel.add(spd);
    position.add(vel);
    duration -= 4;
  }
  
  void show(){
    noStroke();
    fill(random(0, 100), random(0, 255), 255, duration);
    circle(position.x, position.y, size);
  }
  
  boolean isDead(){
    if (duration < 0) {
      return true;
    }else{
      return false;
    }
  }
  
}
