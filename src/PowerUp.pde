class PowerUp {
  PImage powerImage;
  int x, y;
  String type;

  PowerUp(int x, int y, String type) {
    this.x = x;
    this.y = y;
    this.type = type;
  }

  void display() {
    if (type.equals("StaminaOrb")) {
      powerImage = loadImage("stamina.png");
    } else {
      powerImage = loadImage("none.png");
    }

    if (powerImage != null) {
      powerImage.resize(50, 50);
      image(powerImage, x, y);
    }
    moveRight();
  }

  void moveRight() {
    x += 6;
    if (x > width) x = -50; 
  }

  boolean intersect(Player p) {

    float d = dist(x + 25, y + 25, p.x + 100, p.y + 100);
    return (d < 80); 
  }
}
