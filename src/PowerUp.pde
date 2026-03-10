// ANGIE LIU

class PowerUp {
  PImage powerImage;
  int infStaminaTimer, speedUpTimer, x, y;
  String type;
  boolean collide;

  PowerUp(int x, int y, String type) {
    this.x = x;
    this.y = y;
    this.type = type;
    collide = false;
  }

  void display() {
    if (type == "InfiniteStamina") {
      powerImage = loadImage("timer.jpeg");
    } else if (type == "SpeedUp") {
      powerImage = loadImage("none.png");
    } else if (type == "StaminaOrb") {
      powerImage = loadImage("stamina.png");
    }

    powerImage.resize(50, 50);
    image(powerImage, x, y);
    textSize(50);
    fill(255, 0, 0);
    moveRight();
  }


  //used just for the assignment
  void moveRight() {
    x += 6;
    if (x > width) x = 0;
  }

  boolean intersect(Player p) {
    float d = dist(x, y, p.x, p.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
