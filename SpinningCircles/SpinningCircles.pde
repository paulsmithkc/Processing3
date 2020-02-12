
float radius = 40;

void setup() {
  size(400, 400);
  background(0);
  ellipseMode(CENTER);
}

void draw() {
  noStroke();
  fill(255, 128);
  ellipse(width/2,height/2,radius,radius);
}
