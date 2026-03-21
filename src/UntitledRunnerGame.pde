//GRACE the obstacle should be displayed now, make sure to update the obstacle tab too and download the spike.png - ANGIE

//recent changes: added fully functioning UI (pause menu, gameover screen, restart button, button to exit program, tutorial, controls), score system
//working on: gravity simulation, obstacles, music, background aesthetics

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
char screen = 'S'; //S = start screen, M = modes, I = endless mode, O = options/settings screen, C = credits screen, E = game over, P = pause, T = tuorial

//buttons
Button btnPlay, btnInfiniteMode, btnSpeedRunMode, btnSettings, btnBack, btnCredits, btnMainMenu, btnRestart, btnResume, btnQuit, btnTutorial;

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
boolean gameOver = false;
boolean isPaused = false;
int score;
int highScore;

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
  btnPlay = new Button("Play", 800, 400, 400, 100, #ff9538, #ffd1a8, 150);
  btnSettings = new Button("Settings", 800, 600, 300, 75, #ff9538, #ffd1a8, 85);
  btnBack = new Button("Back", 125, 75, 150, 75, #ff9538, #ffd1a8, 75);
  btnCredits = new Button("Credits", 1450, 825, 225, 75, #ff9538, #ffd1a8, 75);
  btnMainMenu = new Button ("Main Menu", 800, 800, 275, 75, #ff9538, #ffd1a8, 50);
  btnRestart = new Button ("Restart", 800, 650, 350, 100, #ff9538, #ffd1a8, 100);
  btnResume = new Button ("Resume", 800, 500, 300, 100, #ff9538, #ffd1a8, 100);
  btnQuit = new Button ("Quit", 150, 825, 200, 75, #ff9538, #ffd1a8, 75);
  btnTutorial = new Button ("Tutorial", 800, 725, 250, 75, #ff9538, #ffd1a8, 75);

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
  case 'P':
    pauseScreen();
    break;
  case 'E':
    gameOver();
    break;
  case 'T':
    tutorialScreen();
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
  btnQuit.display();
  btnTutorial.display();
}

//methods for the actual game
void gameScreen() {

  //only runs if the player is alive or is unpaused
  if (gameOver == false && isPaused == false) {
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

    //movement for stamina orbs and obstacles
    staminaOrb.x += 6;
    obstacle.x += 6;

    if (staminaOrb.intersect(player)) {
      player.stamina += 100;

      if (player.stamina > player.maxStamina) {
        player.stamina = player.maxStamina;
      }

      staminaOrb.x = -100;
      staminaOrb.y = (int)random(300, 550);
    }


    if (staminaOrb.x > width) {
      staminaOrb.x = -100;
      staminaOrb.y = (int)random(300, 550);
    }
    if (obstacle.x > width) {
      obstacle.x = -100;
    }
    
    //score
    score += 5;
    if (score >= highScore) {
      highScore = score;
    }
    fill(255);
    textSize(75);
    text("Score: " + score, 200, 75);
    text("High Score: " + highScore, 270, 150);
  }
  if (player.stamina == 0) {
    screen = 'E';
    gameOver = true;
  }
}



void settingsScreen() {
  image(titleScreen, 0, 0);

  textAlign(CENTER, CENTER);
  textMode(CENTER);
  textSize(150);
  text("Settings", 800, 100);
  textSize(50);
  text("A OR LEFT ARROW - Move left", 800, 200);
  text("D OR RIGHT ARROW - Move Right", 800, 250);
  text("SPACE - Jump", 800, 300);
  text("TAB - Pause", 800, 350);

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
  text("Lead Programmer, UI Designer", 800, 300);
  text("Lead Artist, Assistant Programmer", 800, 500);
  text("Lead Sound Designer, Assistant Programmer", 800, 700);

  btnBack.display();
}

void gameOver() {
  image(backGalcan, 0, 0);

  fill(255);
  textAlign(CENTER, CENTER);
  textMode(CENTER);
  textSize(150);
  text("Game Over!", 800, 100);
  textSize(30);
  text("Monitor your health and stamina carefully...", 800, 150);
  
  textSize(75);
  text("Score: " + score, 800, 250);
  text("High Score: " + highScore, 800, 350);

  btnMainMenu.display();
  btnRestart.display();
}

void pauseScreen() {
  image(backGalcan, 0, 0);

  fill(255);
  textAlign(CENTER, CENTER);
  textMode(CENTER);
  textSize(150);
  text("Paused", 800, 100);
  
  textSize(75);
  text("Current Score: " + score, 800, 250);
  text("Current High Score: " + highScore, 800, 350);

  btnResume.display();
  btnRestart.display();
  btnMainMenu.display();
}

void tutorialScreen() {
  image(titleScreen, 0, 0);

  fill(255);
  textAlign(CENTER, CENTER);
  textMode(CENTER);
  textSize(150);
  text("Tutorial", 800, 100);
  textSize(50);
  text("Stamina will drain when you move, collect blue stamina orbs to regen.", 800, 250);
  text("Avoid the obstacles, they're deadly!", 800, 400);
  text("Jump over the gaps in the terrain to avoid falling into the void.", 800, 550);
  textSize(70);
  text("The game is endless, try to go for as long as you can!", 800, 750);

  btnBack.display();
}

//makes the buttons functional
void mousePressed() {
  switch(screen) {
  case 'S':
    if (btnPlay.clicked()) {
      gameOver = false;
      isPaused = false;
      player.stamina = 100;
      staminaOrb.x = -100;
      staminaOrb.y = (int)random(300, 550);
      obstacle.x = -100;
      score = 0;
      screen = 'I';
      break;
    } else if (btnSettings.clicked()) {
      screen = 'O';
      break;
    } else if (btnCredits.clicked()) {
      screen = 'C';
      break;
    } else if (btnQuit.clicked()) {
      exit();
    } else if (btnTutorial.clicked()) {
      screen = 'T';
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

      screen = 'S';
      break;
    }
  case 'E':
    if (btnRestart.clicked()) {
      gameOver = false;
      player.stamina = 100;
      staminaOrb.x = -100;
      staminaOrb.y = (int)random(300, 550);
      obstacle.x = -100;
      score = 0;
      screen = 'I';
      break;
    } else if (btnResume.clicked()) {
      screen = 'I';
      break;
    } else if (btnMainMenu.clicked()) {
      screen = 'S';
      break;
    }
  case 'P':
    if (btnResume.clicked()) {
      isPaused = false;
      screen = 'I';
      break;
    } else if (btnRestart.clicked()) {
      isPaused = false;
      player.stamina = 100;
      staminaOrb.x = -100;
      staminaOrb.y = (int)random(300, 550);
      obstacle.x = -100;
      score = 0;
      screen = 'I';
      break;
    } else if (btnMainMenu.clicked()) {
      screen = 'S';
      break;
    }
  case 'T':
    if (btnBack.clicked()) {
      screen = 'S';
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

  switch(screen) {
  case 'I':
    if (key == TAB) {
      screen = 'P';
      isPaused = true;
      break;
    }
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
