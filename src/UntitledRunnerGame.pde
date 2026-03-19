//ANGIE LIU

// Set up the images, buttons, fonts, screen sizes

//images
PImage titleScreen, backGalcan, layOneGalcan, layTwoGalcan, layThreeGalcan;

//font
PFont PixelFont;

//music |Grace
//THE SOUND LIBRARY WASNT WORKINGGGGGGGGGGG*
//import processing.sound.*;
//SoundFile spaceLvl;

//screens
char screen = 'S'; //S = start screen, M = modes, I = endless mode, O = options/settings screen, C = credits screen

//buttons
Button btnPlay, btnInfiniteMode, btnSpeedRunMode, btnSettings, btnBack, btnCredits, btnMainMenu, btnRestart;

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
boolean gameOver = false;
boolean isPaused = false;

void setup () {
  size(1600, 900);

  //to make sure it doesn't lag on different types of computers
  pixelDensity(1);

  //music*
  //spaceLvl.play();

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
  btnBack = new Button("Back", 125, 75, 150, 75, #ff9538, #ffd1a8, 75);
  btnCredits = new Button("Credits", 1450, 825, 225, 75, #ff9538, #ffd1a8, 75);
  btnMainMenu = new Button ("Main Menu", 800, 650, 300, 100, #ff9538, #ffd1a8, 75);
  btnRestart = new Button ("Restart", 800, 400, 400, 100, #ff9538, #ffd1a8, 100);

  //power up set up
  staminaOrb = new PowerUp(0, (int)random(300, 500), "StaminaOrb");

  //player set up
  player = new Player(1000, 700, 10);

  //obstacle set up
  obstacle = new Obstacle(0, 600);
}

void draw() {
  //how we're switching the screens
  switch(screen) {
  case 'S':
    startScreen();
    break;
  case 'O':
    settingsScreen();
    break;
  case 'I':
    gameScreen();
    break;
  case 'C':
    creditsScreen();
    break;
  }
}

//methods for each screen
void startScreen () {
  image(titleScreen, 0, 0);

  textAlign(CENTER, CENTER);
  textMode(CENTER);
  textSize(150);
  text("Untitled Runner Game", 800, 100);
  textSize(50);
  text("(Yes That's the Name)", 800, 200);
  textSize(100);

  btnPlay.display();
  btnSettings.display();
  btnCredits.display();
}

//methods for the actual game
void gameScreen() {
  
  //only runs if the player is alive or is unpaused
  if (gameOver == false) {
    image(backGalcan, 0, 0);
    //music*
    //spaceLvl.play();

    //image(layOneGalcan, lay1speed, 0);
    //image(layOneGalcan, lay1speed + layOneGalcan.width, 0);
    //image(layTwoGalcan, lay2speed, 0);
    //image(layTwoGalcan, lay2speed + layTwoGalcan.width, 0);
    //image(layThreeGalcan, lay3speed, 0);
    //image(layThreeGalcan, lay3speed + layThreeGalcan.width, 0);

    //lay1speed -= 0.25;
    //lay2speed -= 0.5;
    //lay3speed -= 0.75;

    //if (lay1speed <= -layOneGalcan.width) {
    //  lay1speed = 0;
    //}
    //if (lay2speed <= -layOneGalcan.width) {
    //  lay2speed = 0;
    //}
    //if (lay3speed <= -layOneGalcan.width) {
    //  lay3speed = 0;
    //}

    staminaOrb.display();
    obstacle.display();
    player.display();

    if (staminaOrb.intersect(player)) {
      player.stamina += 100;

      if (player.stamina > player.maxStamina) {
        player.stamina = player.maxStamina;
      }

      staminaOrb.x = -100;
      staminaOrb.y = (int)random(300, 550);
    }
    
    //movement for stamina orbs and obstacles
    staminaOrb.x += 6;
    obstacle.x += 6;
    if (staminaOrb.x > width) {
      staminaOrb.x = -100;
      staminaOrb.y = (int)random(300, 550);
    }
    if (obstacle.x > width) {
      obstacle.x = -100;
    }
    //instruction thing | Grace
    //fill(255);
    //textSize(50);
    //textAlign(CENTER);
    //text("Use a or left key to move left", 350, 150);
    //fill(255);
    //textSize(50);
    //text("Use d or right key to move right", 1200, 150);
    //text("Use spacebar to jump", 800, 180);
    //text("Collect blue orbs to regain stamina", 800, 210);
  }
  if (player.stamina == 0) {
      gameOver = true;
      gameOver();
    }
}



void settingsScreen() {
  image(titleScreen, 0, 0);

  textAlign(CENTER, CENTER);
  textMode(CENTER);
  textSize(150);
  text("Settings", 800, 100);

  btnBack.display();
}

void creditsScreen() {
  image(titleScreen, 0, 0);

  textAlign(CENTER, CENTER);
  textMode(CENTER);
  textSize(150);
  text("Credits", 800, 100);

  textSize(60);
  text("Angie Liu", 800, 250);
  text("Ryan Oliver", 800, 450);
  text("Grace Perry", 800, 650);

  textSize(35);
  text("Lead Programmer, Debugger", 800, 300);
  text("Lead Artist, Assistant Programmer", 800, 500);
  text("Lead Sound Designer", 800, 700);

  btnBack.display();
}

void gameOver() {
  image(backGalcan, 0, 0);

  fill(255);
  textAlign(CENTER, CENTER);
  textMode(CENTER);
  textSize(150);
  text("Game Over!", 800, 100);
  textSize(50);
  text("Monitor your health and stamina carefully...", 800, 800);

  btnMainMenu.display();
  btnRestart.display();
}

//makes the buttons functional
void mousePressed() {
  switch(screen) {
  case 'S':
    if (btnPlay.clicked()) {
      screen = 'I';
      break;
    } else if (btnSettings.clicked()) {
      screen = 'O';
      break;
    } else if (btnCredits.clicked()) {
      screen = 'C';
      break;
    }
  case 'O':
    if (btnBack.clicked()) {
      screen = 'S';
      break;
    }
  case 'C':
    if (btnBack.clicked()) {
      screen = 'S';
      break;
    }
  case 'I':
    if (btnMainMenu.clicked()) {
      gameOver = false;
      player.stamina = 100;
      staminaOrb.x = -100;
      obstacle.x = -100;
      screen = 'S';
      break;
    } else if (btnRestart.clicked()) {
      gameOver = false;
      player.stamina = 100;
      screen = 'I';
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
