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
    }
    
    image(powerImage, x, y);
    textSize(50);
    fill(255,0,0);
    text("Place holder power up", x, y);
  }
  
  //boolean getPowerUp() {}
  
  //used just for the assignment
  void moveRight() {
    x += 6;
    if (x > width) x = 0;
  }
  
}
