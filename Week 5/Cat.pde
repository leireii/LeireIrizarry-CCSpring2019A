class Cat{
  public void drawFace(){
    strokeWeight(3);
    stroke(0);
    rect(width/2 - 200, height/2, 400, 400);
    ellipse(width/2, height/2, 500, 400);
  }
  
  public void drawEars(char emotion){
    fill(200);
    char e = emotion;
    noStroke();
    // draw normal ears
    if (e == 'n'){
      triangle(270, 100,
               270, 350,
               500, 300);
      triangle(730, 100,
               730, 350,
               500, 300);
    }
    
    // draw angry ears
    if (e == 'm'){
      triangle(100, 400,
               300, 400,
               400, 220);
      triangle(900, 400,
               700, 400,
               600, 220);
    }
  }
  
  public void drawEyes(char emotion){
    char e = emotion;
    fill(255, 255, 0);
    noStroke();
    
    if (e == 'm'){
      arc(375, 350, 125, 100, radians(PI), radians(180));
      arc(625, 350, 125, 100, radians(PI), radians(180));
      fill(0);
      circle(375, 370, 20);
      circle(625, 370, 20);
    }
    
    if (e == 'n'){
      fill(255, 255, 0);
      circle(375, 350, 100);
      circle(625, 350, 100);
      fill(0);
      circle(375, 350, 90);
      circle(625, 350, 90);
    }
    
    if (e == 'h'){
      fill(200);
      stroke(0);
      strokeWeight(3);
      arc(375, 375, 100, 100, PI, TWO_PI);
      arc(625, 375, 100, 100, PI, TWO_PI);
    }
    
  }
  
  public void drawMouth(char emotion){
    char e = emotion;
    
    strokeWeight(3);
    stroke(0);
    
    if (e == 'm'){
      line(400, height/2 + 100,
           500, height/2 + 50);
      line(600, height/2 + 100,
           500, height/2 + 50);
           
    }else if (e == 'n'){
      arc(450, 450, 100, 100, radians(PI), radians(180));
      arc(550, 450, 100, 100, radians(PI), radians(180));
      
    }else if (e == 'h'){
      fill(255, 50, 50);
      arc(500, 455, 200, 200, radians(PI), radians (180));
      fill(200);
      arc(450, 450, 100, 100, radians(PI), radians(180));
      arc(550, 450, 100, 100, radians(PI), radians(180));
    }
    
    fill(255, 100, 100);
    triangle(450, height/2 + 20, 550, height/2 + 20, 500, height/2 + 50);
  }
  
  public void drawTail(float x){
    float xPos = x;
    strokeWeight(100);
    fill(175);
    stroke(170);
    
    if (xPos < width/2) {
      line(xPos, height/2, xPos + 150, height);
    }else{
      line(xPos, height/2, xPos - 150, height);
    }
  }
}
