//ANGIE LIU

// Set up the images, buttons, fonts, screen sizes

//images
PImage titleScreen, galacticCanyon;

//font
PFont PixelFont;

//screens
char screen = 'S'; //S = start screen, M = modes, G = actual game, O = options/settings screen

//buttons
Button btnPlay, btnInfiniteMode, btnSpeedRunMode, btnSettings;

void setup () {
  size(1600, 900);
  
  //font setup
  PixelFont = createFont("PixelFont.ttf", 32);
  textFont(PixelFont);
  
  //image setup
  titleScreen = loadImage("titleScreen.png");
  galacticCanyon = loadImage("GalacticCanyonBackground.png");
  
  //button setup, parameters in order are text, x position, y position, width, height, normal color, hovering color, text size
  btnPlay = new Button("Play", 800, 450, 400, 100, #ff9538, #ffd1a8, 150);
  btnSettings = new Button("Settings", 800, 650, 350, 100, #ff9538, #ffd1a8, 100);
}

void draw() {
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
}

void gameScreen() {
  image(galacticCanyon, 0, 0);
  
  //if (inGame == 1) {
    //RandTerrain BackObj = new RandTerrain();
    //BackObj.backgrounds();
    //}
}

void settingsScreen() {}

//makes the button functional
void mousePressed() {
  switch(screen) {
    case 'S':
      if (btnPlay.clicked()) {
        screen = 'G';
        break;
      }
  }
}

void keyPressed() {}
