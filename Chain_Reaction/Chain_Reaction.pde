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
    balls[i].move();
  }
  if (reactionStarted == true) {
    Ball first = balls[0];
    reaction(first);
    for (int i = 0; i < balls.length; i++) {
      for (int j = 0; j < balls.length; j++) {
        if ((j != i) && ((balls[i].state == 1) || (balls[j].state == 1))) {
          if (balls[i].intersects(balls[j])) {
            reaction(balls[i]);
          }
        }
      }
    }
  }
}

void mouseClicked() {
  reactionStarted = true;
}

void reaction(Ball b) {
  b.dx = 0;
  b.dy = 0;
  b.state = 1;
  while (b.rad < 50) {
    b.rad++;
  }
  /* while (b.rad > 0){
   b.rad--;
   b.state = 3;
   }
   */
}