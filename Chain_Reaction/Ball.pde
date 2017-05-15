class Ball {

  float x;
  float y;
  float rad;
  color c;
  float dx;
  float dy;
  int state;
  /* States:
   0 = alive
   1 = growing
   2 = shrinking
   3 = dead
   */

  Ball() {
    x = random(600.0);
    y = random(650.0);
    rad = 15.0;
    c = color(random(255), random(255), random(255));
    dx = random(-4.0, 4.0);
    dy = random(-4.0, 4.0);
    state = 0;
  }

  void move() {
    x+=dx;
    y+=dy;
    bounce();
  }

  void bounce() {
    if (x <= 0 || x >= 600) {
      dx= -dx;
    } else if (y <= 0 || y >= 600) {
      dy = -dy;
    }
  }
}