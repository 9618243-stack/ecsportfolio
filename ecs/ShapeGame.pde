// Lucy Kleven | 4 March 2026 | ShapeGame
int x, y, tx, ty, score;
float tw;
PImage player, target;

void setup() {
  size(500, 500);
  x = width/2;
  y = height/2;
  tx = int(random(20, width-20));
  ty = int(random(20, height-20));
  tw = 100;
  score = 0;
  player = loadImage("2NewPiskel.png");
  target = loadImage("NewPiskel.png");
}


void draw() {
  background(150, 0, 0);
  scorePanel();
  target();
  imageMode(CENTER);
  image(player, x, y);
  //ellipse(x, y, 20, 20);
}

void target() {
  float d = dist(x, y, tx, ty);
  println(d);
  println(score);
  imageMode(CENTER);
  image(target, tx, ty);
  if (d<40) {
    score = score + int(tw*2);
    tx = int(random(20, width-20));
    ty = int(random(20, height-20));
    tw=200;
  }
  rectMode(CENTER);
  //rect(tx, ty, tw, tw);
  if (tw<10) {
    gameOver();
  }
  image(target, tx, ty);
  tw = tw - 0.1;
  target.resize(int(tw), int(tw));
}

void gameOver() {
  background(0);
  fill(255, 0, 0);
  textSize(40);
  text("GAME OVER", width/2, height/2);
}

void scorePanel() {
  rectMode(CENTER);
  fill(#FFFFFF);
  rect(width/2, 15, width, 30);
  fill(0);
  textSize(20);
  text("SCORE:" + score, 20, 25);
}

void keyPressed() {
  if (x > width) {
    x = 0;
  }

  if (x < 0) {
    x = width;
  }

  if (y > height) {
    y = 0;
  }

  if (y < 0) {
    y = height;
  }

  // WASD and Arrow Movement
  if (key == 'w' || key == 'W' || keyCode == UP) {
    y = y - 10;
  } else if (key == 's' || key == 'S' || keyCode == DOWN) {
    y = y + 10;
  } else if (key == 'd' || key == 'D' || keyCode == RIGHT) {
    x = x + 10;
  } else if (key == 'a' || key == 'A' || keyCode == LEFT) {
    x = x - 10;
  }
}
