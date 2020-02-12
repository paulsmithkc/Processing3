
float step = 40;

void setup() {
  size(400, 600);
  background(#020F59);
  frameRate(20);
  smooth();
}

void draw() {
  background(#020F59);
  
  noStroke();
  fill(255,200);
  for (float x = -step; x <= width + step; x += step) {
    for (float y = -step; y <= height + step; y += step) {
      float time = frameCount / 20.0f;
      float offx = (noise(x + time, y) - 0.5f) * 100;
      float offy = (noise(x, y + time) - 0.5f) * 100;
      circle(x + offx, y + offy, 10); 
    }
  }
  
  if (mousePressed) {
    stroke(#0424D9);
    strokeWeight(10);
    fill(255);
    circle(mouseX, mouseY, 40); 
  }
}

void mousePressed() {
}
