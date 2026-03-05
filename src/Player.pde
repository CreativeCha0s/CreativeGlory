//GRACE PERRY

class Player {

  // --- Position ---
  float x, y, speed;
  
  boolean moveRight, moveLeft, jump;

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
  
  //player movement
  void move () {
    if (keyPressed) {
      if (key == 'd' || keyCode == RIGHT) {
        moveRight = true;
        if (moveRight) {
          x += speed;
       }
      }
      if (key == 'a' || keyCode == LEFT) {
        moveLeft = true;
        if (moveLeft) {
          x -= speed;
        }
      }
    }
    //if (keyCode == 32) {
      
    //}
  }
}
