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
    if (state == 0){
      x+=dx;
      y+=dy;
      bounce();
    }
    if (state == 1){
      rad += 1.0;
    }
    if (rad >= 100.0){
      state = 2;
    }
    if (state == 2){
      rad -= 1.0;
    }
    if (rad <= 0.0){
      state = 3;
    }
  }

  void bounce() {
    if (x <= 0 || x >= 600) {
      dx= -dx;
    } else if (y <= 0 || y >= 600) {
      dy = -dy;
    }
  }
  
  
  boolean intersects(Ball b){
    return dist(b.x, b.y, this.x, this.y) < b.rad + this.rad;
  }
}