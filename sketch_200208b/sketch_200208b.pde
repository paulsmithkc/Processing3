float step = 40;

void setup() {
  size(600, 400);
  background(#020F59);
  frameRate(60);
}

void draw() {
  background(#020F59);
  
  // snow
  noStroke();
  fill(255,200);
  for (float x = -step; x <= width + step; x += step) {
    for (float y = -step*60; y <= height + step; y += step) {
      float time = frameCount / 200.0f;
      float offx = (noise(x/width + time, y/height) - 0.5f) * 200;
      float offy = (noise(x/width, y/height + time) - 0.5f) * 200;
      circle(x + offx, y + offy + frameCount*2, 10); 
    }
  }
  
  // init colors
  stroke(#0424D9);
  strokeWeight(10);
  fill(255);
  
  // draw neck
  ellipse(300,350,250,250);
  
  // draw head
  ellipse(300,200,150,150);
  
  // tophat
  rect(250,90,100,50);
  line(200,140,400,140);
  
  // draw eyes
  strokeWeight(30);
  point(260,200);
  point(340,200);
  
  // draw mouth
  strokeWeight(5);
  line(300,240,280,220);
  line(300,240,320,220);
  
  // bowtie
  noStroke();
  fill(255, 0, 0);
  circle(300,280,30);
  triangle(300,280,240,260,240,300);
  triangle(300,280,360,260,360,300);
  
  saveFrame("frames/####.tga");
}
