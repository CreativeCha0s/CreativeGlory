// ANGIE LIU

class PowerUp {
  PImage infStam, speedUp;
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
      infStam = loadImage("none.png");
    }
  }
  
  //boolean getPowerUp() {}
  
}
