import processing.pdf.*;

PImage img;
float angle;
int resolution = 8;

void setup() {
  size(600, 600, P3D);
  noLights();
  frameRate(60);
  noFill();

  // Extract the brightness of each pixel in the image
  // and store in the "values" array
  img = loadImage("rings.jpg");
  img.loadPixels();
}

void draw() {
  background(0);
  translate(width/2.0 - 100, height/2.0, -512);
  scale(2.0);
  
  // Update the angle
  angle += 0.02;
  rotateY(angle);
  //rotateY(PI / 12);
  
  // Display the image mass
  stroke(255);
  strokeWeight(2);
  float xoff = -img.width/2.0;
  float yoff = -img.height/2.0;
  for (int i = 0; i < img.height; i += resolution) {
    for (int j = 0; j < img.width; j += resolution) {
      color pixel = img.pixels[i*img.width + j];
      stroke(pixel);
      int value = int(brightness(pixel));
      float x = j + xoff;
      float y = i + yoff;
      line(x, y, value, x, y, value-4);
    }
  }
  
  //saveFrame("render.png");
}
