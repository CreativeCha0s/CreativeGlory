//RYAN OLIVER

class Obstacle {

  // --- Position ---
  float x, y;

  PImage placeholder;

  Obstacle(float x, float y) {
    this.x = x;
    this.y = y;
    
    placeholder = loadImage("placeholder.jpeg");
  }

  void display() {
    image(placeholder, x, y);
    placeholder.resize(200, 200);
    text("Obstacle place holder", x, y);
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
