// Lucy Kleven | March 18, 2026 | Click the Target

float targetX, targetY;
float targetSize = 50;
int score = 0;
int timer = 10;
int startTime;
boolean gameOver = false;
float speed = 2.0; 

void setup() {
  size(600, 400);
  resetTarget();
  startTime = millis(); 
}

void draw() {
  background(135, 206, 235); 

  if (!gameOver) {
    
    int elapsed = (millis() - startTime) / 1000;
    timer = 10 - elapsed;
    
    if (timer <= 0) {
      timer = 0;
      gameOver = true;
    }

    
    targetX += random(-speed, speed);
    targetY += random(-speed, speed);

    
    targetX = constrain(targetX, targetSize, width - targetSize);
    targetY = constrain(targetY, targetSize, height - targetSize);

    
    fill(255, 0, 0);
    noStroke();
    ellipse(targetX, targetY, targetSize, targetSize);
    fill(255);
    ellipse(targetX, targetY, targetSize/2, targetSize/2); 

    
    fill(0);
    textSize(24);
    text("Score: " + score, 20, 30);
    text("Time: " + timer, width - 100, 30);
    
  } else {
    
    fill(0);
    textAlign(CENTER);
    textSize(50);
    text("GAME OVER", width/2, height/2);
    textSize(30);
    text("Final Score: " + score, width/2, height/2 + 50);
    text("Click to Restart", width/2, height/2 + 90);
  }
}

void mousePressed() {
  if (gameOver) {
    
    score = 0;
    timer = 10;
    speed = 2.0;
    startTime = millis();
    gameOver = false;
    resetTarget();
  } else {
    
    float d = dist(mouseX, mouseY, targetX, targetY);
    if (d < targetSize / 2) {
      score++;
      speed += 0.5; 
      targetSize = max(20, targetSize - 2); 
      resetTarget();
    }
  }
}


void resetTarget() {
  targetX = random(targetSize, width - targetSize);
  targetY = random(targetSize, height - targetSize);
}
