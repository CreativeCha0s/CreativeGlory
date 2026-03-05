//GRACE PERRY

class Player {

  // --- Position ---
  float x, y, speed;

  PImage test;

  Player(float x, float y, float speed) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    
    test = loadImage("testCharacter.png");
  }

  void display() {
    image(test, x, y);
    test.resize(200, 200);
    text("Player place holder", x, y);
  }
  
  void moveRight() {
    x += speed;
  }
  
  void moveLeft() {
    x -= speed;
  }
  
  void jump () {
    y -= 10;
  }
}
