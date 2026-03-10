//ANGIE LIU

// Set up the images, buttons, fonts, screen sizes

//images
PImage titleScreen, backGalcan, layOneGalcan, layTwoGalcan, layThreeGalcan;

//font
PFont PixelFont;

//screens
char screen = 'S'; //S = start screen, M = modes, G = actual game, O = options/settings screen

//buttons
Button btnPlay, btnInfiniteMode, btnSpeedRunMode, btnSettings;

//powerups
PowerUp staminaOrb;

//player
Player player;

//obstacle
Obstacle obstacle;

//global variables
float lay1speed = 0;
float lay2speed = 0;
float lay3speed = 0;
int inGame = 0;
int mode = 0;


void setup () {
  size(1600, 900);

  frameRate(90);

  //font setup
  PixelFont = createFont("PixelFont.ttf", 32);
  textFont(PixelFont);

  //image setup
  titleScreen = loadImage("titleScreen.png");
  backGalcan = loadImage("GalacticCanyonBackground.png");
  layOneGalcan = loadImage("GalacticCanyonLayer1.png");
  layTwoGalcan = loadImage("GalacticCanyonLayer2.png");
  layThreeGalcan = loadImage("GalacticCanyonLayer3.png");


  //button setup, parameters in order are text, x position, y position, width, height, normal color, hovering color, text size
  btnPlay = new Button("Play", 800, 450, 400, 100, #ff9538, #ffd1a8, 150);
  btnSettings = new Button("Settings", 800, 650, 350, 100, #ff9538, #ffd1a8, 100);
  btnSpeedRunMode = new Button ("Speedrun Mode", 800, 450, 570, 100, #ff9538, #ffd1a8, 100);
  btnInfiniteMode = new Button ("Endless Mode", 800, 650, 550, 100, #ff9538, #ffd1a8, 100);

  //power up set up
  staminaOrb = new PowerUp(500, 500, "StaminaOrb");

  //player set up
  player = new Player(1000, 700, 10);

  //obstacle set up
  obstacle = new Obstacle(400, 600);
}

void draw() {
  //powerups
  if (staminaOrb.intersect(player)) {
    player.stamina+=1;
  }

  //how we're switching the screens
  switch(screen) {
  case 'S':
    startScreen();
    break;
  case 'M':
    modeScreen();
    break;
  case 'G':
    gameScreen();
    break;
  case 'O':
    settingsScreen();
    break;
  }
}

//methods are each screen
void startScreen () {
  image(titleScreen, 0, 0);

  textAlign(CENTER, CENTER);
  textMode(CENTER);
  textSize(100);
  text("Untitled Runner Game", 800, 100);
  textSize(50);
  text("By Angie, Grace, & Ryan", 800, 150);
  textSize(100);

  btnPlay.display();
  btnSettings.display();
}

void modeScreen () {
  image(titleScreen, 0, 0);

  text ("Modes", 800, 100);

  btnInfiniteMode.display();
  btnSpeedRunMode.display();
}

//methods for the two modes
void speedRunMode() {
  image(backGalcan, 0, 0);
  //image(layOneGalcan, lay1speed, 0);
  image(layOneGalcan, lay1speed + layOneGalcan.width, 0);
  //image(layTwoGalcan, lay2speed, 0);
  image(layTwoGalcan, lay2speed + layTwoGalcan.width, 0);
  //image(layThreeGalcan, lay3speed, 0);
  image(layThreeGalcan, lay3speed + layThreeGalcan.width, 0);

  lay1speed -= 0.25;
  lay2speed -= 0.5;
  lay3speed -= 0.75;

  if (lay1speed <= -layOneGalcan.width) {
    lay1speed = 0;
  }
  if (lay2speed <= -layOneGalcan.width) {
    lay2speed = 0;
  }
  if (lay3speed <= -layOneGalcan.width) {
    lay3speed = 0;
  }

  staminaOrb.display();
  player.display();
  obstacle.display();
  obstacle.moveRight();
}

void infiniteMode() {
  image(backGalcan, 0, 0);
  image(layOneGalcan, lay1speed, 0);
  image(layOneGalcan, lay1speed + layOneGalcan.width, 0);
  image(layTwoGalcan, lay2speed, 0);
  image(layTwoGalcan, lay2speed + layTwoGalcan.width, 0);
  image(layThreeGalcan, lay3speed, 0);
  image(layThreeGalcan, lay3speed + layThreeGalcan.width, 0);

  lay1speed -= 0.25;
  lay2speed -= 0.5;
  lay3speed -= 0.75;

  if (lay1speed <= -layOneGalcan.width) {
    lay1speed = 0;
  }
  if (lay2speed <= -layOneGalcan.width) {
    lay2speed = 0;
  }
  if (lay3speed <= -layOneGalcan.width) {
    lay3speed = 0;
  }

  staminaOrb.display();
  player.display();
  obstacle.display();
  obstacle.moveRight();
}


void gameScreen() {
  image(backGalcan, 0, 0);
  image(layOneGalcan, lay1speed, 0);
  image(layOneGalcan, lay1speed + layOneGalcan.width, 0);
  image(layTwoGalcan, lay2speed, 0);
  image(layTwoGalcan, lay2speed + layTwoGalcan.width, 0);
  image(layThreeGalcan, lay3speed, 0);
  image(layThreeGalcan, lay3speed + layThreeGalcan.width, 0);

  lay1speed -= 0.25;
  lay2speed -= 0.5;
  lay3speed -= 0.75;

  if (lay1speed <= -layOneGalcan.width) {
    lay1speed = 0;
  }
  if (lay2speed <= -layOneGalcan.width) {
    lay2speed = 0;
  }
  if (lay3speed <= -layOneGalcan.width) {
    lay3speed = 0;
  }

  staminaOrb.display();
  player.display();
  obstacle.display();
  obstacle.moveRight();
}

void settingsScreen() {
  image(titleScreen, 0, 0);

  text("Settings", 800, 100);
}

//makes the buttons functional
void mousePressed() {
  switch(screen) {
  case 'S':
    if (btnPlay.clicked()) {
      screen = 'M';
      break;
    }
  case 'M':
    if (btnSpeedRunMode.clicked()) {
      screen = 'G';
      break;
    } else if (btnInfiniteMode.clicked()) {
      screen = 'G';
      break;
    } else if (btnSettings.clicked()) {
      screen = 'O';
      break;
    }
  }
}

void keyPressed() {
  //player movement, full code in player class
  if (key == 'a' || keyCode == LEFT) {
    player.isMovingLeft = true;
  }
  if (key == 'd' || keyCode == RIGHT) {
    player.isMovingRight = true;
  }

  //player jumping, full code in player class
  if (keyCode == 32) {
    player.jump();
  }
}

void keyReleased() {
  //stops movement if the key is released
  if (key == 'a' || keyCode == LEFT) {
    player.isMovingLeft = false;
  }
  if (key == 'd' || keyCode == RIGHT) {
    player.isMovingRight = false;
  }
}
