/*
Author: Leire Irizarry

*/

// initialize global variable
Table nyc_jobs;

void setup(){
  size(800, 800);
  background(0);
  
  // load file
  nyc_jobs = loadTable("NYC_Jobs.csv", "header");
  
  
  int row_count = nyc_jobs.getRowCount();
  // circle container, same amount of circles as jobs
  Circle[] circles = new Circle[row_count];
  
  for (int i = 0; i < circles.length; i++){
    float min = nyc_jobs.getRow(i).getFloat("Salary Range From");
    println(min);
    float max = nyc_jobs.getRow(i).getFloat("Salary Range To");
    circles[i] = new Circle(random(0, width), random(0, height), min, max);
  }

  // 
  
}

void draw(){
  background(0);
  for (int i = 0; i < circles.length; i++){
    Circle circle = circles[i];
     if(circle.isDead()){
     circles.remove(i);
   }
    circle.move();
    circle.display();
  }
}
