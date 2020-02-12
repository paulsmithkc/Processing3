
float gravity = 20;
float elasticity = 0.9;
Ball[] balls;
//color[] colors = { #FF7817, #FF152C, #800A16, #40050B, #000000 };
//color[] colors = { #ffffff, #cccccc, #999999, #666666, #333333 };
color[] colors = { #B34A00, #FF852E, #FF7614, #3EAAB3, #14EBFF };

class Ball {
  public float posX, posY;
  public float velX, velY;
  public float radius;
  public color c;
  
  public void physics() {
    posX += velX;
    posY += velY;
    velY += gravity / 30;
    
    if (posX <= 0) {
      posX = 0;
      velX = -velX * elasticity;
    }
    if (posY <= 0) {
      posY = 0;
      velY = -velY * elasticity;
    }
    if (posX >= width) {
      posX = width;
      velX = -velX * elasticity;
    }
    if (posY >= height) {
      posY = height;
      velY = -velY * elasticity;
    }
    
    //c = (c + 0.1f) % colors.length;
  }
}

void setup() {
  size(1200, 400);
  //fullScreen();
  background(0);
  frameRate(30);
  smooth();
  
  reset();
}

void draw() {
  //background(0);
  
  physics();
  
  stroke(0);
  strokeWeight(1);
  fill(255);
  
  for (int i = 0; i < balls.length; ++i) {
    fill(balls[i].c);
    circle(balls[i].posX, balls[i].posY, balls[i].radius);
  }
  
  saveFrame("frames/####.png");
}

void mousePressed() {
  background(0);
  reset();
}

void reset() {
  balls = new Ball[colors.length];
  for (int i = 0; i < balls.length; ++i) {
    balls[i] = new Ball();
    balls[i].posX = 5; //random(0, width);
    balls[i].posY = i * height / balls.length + 5; //random(0, height);
    balls[i].velX = 5; //int(random(5, 10));
    balls[i].velY = 0; //int(random(1, 5));
    balls[i].radius = 20; //int(random(40, 80));
    balls[i].c = colors[i % colors.length];//random(0, colors.length);
  }
}

void physics() {
  for (int i = 0; i < balls.length; ++i) {
    balls[i].physics();
  }
}
