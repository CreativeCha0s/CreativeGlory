//GRACE PERRY

class Player {

  // --- Position ---
  float x, y, speed, gravity, yVelocity, groundY, jumpStrength;

  boolean isMovingLeft, isMovingRight, isGrounded;

  PImage test;

  Player(float x, float y, float speed) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    gravity = 0.6;
    yVelocity = 0;
    groundY = 600;
    jumpStrength = -17;

    isMovingLeft = false;
    isMovingRight = false;
    isGrounded = true;

    test = loadImage("testCharacter.png");
  }

  void display() {
    image(test, x, y);
    test.resize(200, 200);
    text("Player place holder", x, y);
    
    //called in the display method so we don't need to call it everytime on the main class
    update();
    move();
  }

  void update() {
    //applies gravity

    yVelocity += gravity;
    y += yVelocity;

    //ground collision
    if (y >= groundY) {
      y = groundY;
      yVelocity = 0;
      isGrounded = true;
    }
  }

  //player movement
  void move () {
    if (isMovingLeft == true) {
      x -= speed;
    }
    if (isMovingRight == true) {
      x += speed;
    }
  }
  
  void jump() {
    if(isGrounded) {
      yVelocity = jumpStrength;
      isGrounded = false;
    }
  }
}
