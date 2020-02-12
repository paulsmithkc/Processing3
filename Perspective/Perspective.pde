
float margin = 50;
float step = 40;

void setup() {
  size(800, 600);
  smooth();
  noFill();
}

void draw() {
  background(0);
  stroke(#FF4900);
  for (float x = margin; x <= width - margin; x += step) {
      for (float y = margin; y <= height - margin; y += step) {
        line(x, y, width/2, height/2);
      }
    }
}
