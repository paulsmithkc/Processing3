float STEP = 30;
char BEGIN_KANJI = '\u3040';
char END_KANJI = '\u309f';
int RANGE_KANJI = END_KANJI - BEGIN_KANJI;
//https://stackoverflow.com/a/30200250/8645145

int w, h;
char[][] front;

char randomKanji() {
  return char(int(random(RANGE_KANJI)) + BEGIN_KANJI);
}

char[] kanjiCharset() {
  char[] charset = new char[RANGE_KANJI+1];
  int i = 0;
  for (char c = BEGIN_KANJI; c <= END_KANJI; ++c, ++i) {
    charset[i] = c;
  }
  return charset;
}

void randomize() {
  for (int y = 0; y < h; ++y) {
    for (int x = 0; x < w; ++x) {
      front[y][x] = randomKanji();
    }
  }
}

void setup() {
  size(400,400);
  frameRate(60);
  smooth();
  
  w = int(width / STEP) + 1;
  h = int(height / STEP) + 1;
  front = new char[h][w];
  randomize();
  
  //print(PFont.list());
  PFont font = createFont("Open Sans", 16, true, kanjiCharset());
  textFont(font);
  textSize(STEP * 0.75);
  textAlign(CENTER, CENTER);
  fill(#00ffff);
}

void draw() {
  background(0);
  
  if (frameCount % 60 == 0) {
    randomize();
  }
  
  float time = frameCount / 20.0;
  for (int y = 0; y < h; ++y) {
    for (int x = 0; x < w; ++x) {
      if (random(1) <= 0.3) {
        front[y][x] = randomKanji();
      }
      float xp = (x + 0.5) * STEP + noise(x + time, y);
      float yp = (y + 0.5) * STEP + noise(x + time, y);
      text(front[y][x], xp, yp);
    }
  }
}

void mousePressed() {
  randomize();
}
