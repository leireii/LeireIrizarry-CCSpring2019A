class Circle{
  constructor(x, y, r, options = {isStatic: false}){
    this.r = r;

    this.body = Bodies.circle(x, y, r, options);

    World.add(engine.world, this.body);
  }

  display(){
    var pos = this.body.position;

    push();
    translate(pos.x, pos.y);
    fill(100, 100, 255);
    noStroke();
    circle(0, 0, this.r*2);
    pop();
  }

  isGone(){
    return(this.body.position.y > height)
    }
}
