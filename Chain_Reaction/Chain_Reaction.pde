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
    ellipse(balls[i].x,balls[i].y,balls[i].rad*2,balls[i].rad*2);
    balls[i].move();
  }
}

void mouseClicked(){
  reactionStarted = true;
  Ball first = balls[0];
  reaction(first);
  for (int i = 0; i < balls.length; i++){
    if (first.x == balls[i].x && first.y == balls[i].y){
      reaction(balls[i]);
    }
  }
}

void reaction(Ball b){
  b.dx = 0;
  b.dy = 0;
  while (b.rad < 100){
    b.rad++;
  }
}