Ball[] balls;

boolean reactionStarted;

void setup() {
  size(600, 600);
  reactionStarted = false;
  balls = new Ball[25];
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball();
  }
  noStroke();
}

void draw() {
  background(0);
  for (int i = 0; i<balls.length; i++) {
    fill(balls[i].c);
    ellipse(balls[i].x, balls[i].y, balls[i].rad*2, balls[i].rad*2);
    if (reactionStarted && balls[i].state == 1) {
      for (int k = 0; k<balls.length; k++) {
        if (balls[i].intersects(balls[k]) && balls[k].state == 0) {
          balls[k].state = 1;
        }
      }
    }
    balls[i].move();
  }
}

void mouseClicked() {
  reactionStarted = true;
  balls[0].state = 1;
  balls[0].x = mouseX;
  balls[0].y = mouseY;
}


/* while (b.rad > 0){
 b.rad--;
 b.state = 3;
 }
 */