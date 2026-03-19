//RYAN OLIVER

class Obstacle {

  // --- Position ---
  float x, y;

  PImage spike;

  Obstacle(float x, float y) {
    this.x = x;
    this.y = y;
    
    spike = loadImage("spike.png");
  }

  void display() {
    image(spike, x, y, 200, 200);
    moveRight();
  }

//used just for the assignment
  void moveRight() {
    x += 6;
    if (x > width) x = 0;
  }
}
