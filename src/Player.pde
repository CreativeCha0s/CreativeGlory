//GRACE PERRY

class Player {

  // --- Position ---
  float x, y, speed;
  
  boolean isMovingLeft, isMovingRight;

  PImage test;

  Player(float x, float y, float speed) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    
    isMovingLeft = false;
    isMovingRight = false;
    
    test = loadImage("testCharacter.png");
  }

  void display() {
    image(test, x, y);
    test.resize(200, 200);
    text("Player place holder", x, y);
  }
  
  //player movement
  void move () {
    if (isMovingLeft == true) {
      x -= speed;
    }
    if (isMovingRight == true) {
      x += speed;
    }
  }
}
