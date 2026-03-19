//RYAN OLIVER

class Obstacle {

  // --- Position ---
  float x, y;

  PImage spike;

  Obstacle(float x, float y) {
    this.x = x;
    this.y = y;
    
    //placeholder
    spike = loadImage("spike.png");
  }

  void display() {
    image(spike, x, y, 200, 200);
  }

}
