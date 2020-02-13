//https://stackoverflow.com/a/30200250/8645145
//https://www.fontspace.com/daredemotypo/nikkyou-sans
float FONT_SIZE = 40;
float ANGLE_STEP = TAU / 20;
float RADIUS = 100;
char BEGIN_KANJI = '\u3041';
char END_KANJI = '\u3096';
int RANGE_KANJI = END_KANJI - BEGIN_KANJI;
color LIGHT_COLOR = #00cccc;
color DARK_COLOR = #003333;

int n;
char[] charset;
char[] chars;
color[] colors;
float angle;

char[] buildCharset() {
  char[] charset = new char[RANGE_KANJI+1];
  int i = 0;
  for (char c = BEGIN_KANJI; c <= END_KANJI; ++c, ++i) {
    charset[i] = c;
  }
  return charset;
}

char randomKanji() {
  //return char(int(random(BEGIN_KANJI, END_KANJI)));
  return charset[int(random(0, charset.length-1))];
}

void refresh() {
  for (int i = 0; i < n; ++i) {
    chars[i] = randomKanji();
    colors[i] = LIGHT_COLOR;
  }
  angle = random(0,TAU);
}

void setup() {
  size(420,420);
  //fullScreen();
  frameRate(60);
  smooth();
  
  n = int(TAU / ANGLE_STEP);
  charset = buildCharset();
  chars = new char[n];
  colors = new color[n];
  refresh();
  
  PFont font = createFont("NikkyouSans-B6aV.ttf", 16, true, charset);
  textFont(font);
  textSize(FONT_SIZE);
  textAlign(CENTER, CENTER);
}

void draw() {
  background(0);
  translate(width * 0.5, height * 0.5);
  
  //if (frameCount % 60 == 0) {
  //  refresh();
  //}
  
  float time = frameCount / 20.0;
  
  // rotate ring
  angle += TAU / 300;
  
  // draw characters
  int i = 0;
  float theta = angle;
  for (; i < n; ++i, theta += ANGLE_STEP) {
    if (random(1) <= 0.1) {
      chars[i] = randomKanji();
      colors[i] = LIGHT_COLOR;
    } else {
      colors[i] = lerpColor(colors[i], DARK_COLOR, 0.1);
    }
    float r = RADIUS + exp(noise(theta + time) * 5);
    float xp = r * cos(theta);
    float yp = r * sin(theta);
    fill(colors[i]);
    text(chars[i], xp, yp);
  }
}

void mousePressed() {
  refresh();
}
