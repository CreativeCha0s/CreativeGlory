//GRACE PERRY

class Player {

  // --- Position ---
  float x, y;

  PImage test;

  Player(float x, float y) {
    this.x = x;
    this.y = y;
    
    test = loadImage("testCharacter.png");
  }

  void display() {
    image(test, x, y);
    test.resize(200, 200);
    text("Player place holder", x, y);
  }

  //void moveLeft() {
  //  x -= 25;
  //  if (x < 0) x = width;
  //}

//used just for the assignment
  void moveRight() {
    x += 6;
    if (x > width) x = 0;
  }
}
