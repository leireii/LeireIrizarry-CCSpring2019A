class Circle{
  
  float x;
  float y;
  float max;
  float min;
  float radius;
  int opacity;
  color c;
  
  // constructor
  public Circle(){
  }
  
  public Circle(float x, float y, float min, float max){
    this.x = x;
    this.y = y;
    this.min = min;
    this.max = max;
    this.radius = (min + max)/2.0;
    this.radius = map(this.radius, 0, 100000, 5, 50);
    this.c = color(random(255), random(255), random(255));
    this.opacity = 255;
  }
  
  // methods
  void move(){
   this.x += random(-.2, .2);
   this.y += random(-.2, .2);
  }
  
  void display(){
    fill(this.c,this.opacity);
    noStroke();
    circle(this.x, this.y, this.radius);
    this.opacity -= 10;
    this.radius -= 10;
  }
  
  void isDead(){
    if (this.opacity < 10){
      
    }   
  }
}
