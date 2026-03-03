//GRACE PERRY

class Player {

  // --- Position ---
  float x, y;

  PImage test;

  Player() {
    x = 0;
    y = 0;

    test = loadImage("testCharacter.png");
  }

  void display() {
    imageMode(CENTER);
    image(test, x, y);
    test.resize(13, 13);
  }

  //void moveLeft() {
  //  x -= 25;
  //  if (x < 0) x = width;
  //}

  //void moveRight() {
  //  x += 25;
  //  if (x > width) x = 0;
  //}
}
