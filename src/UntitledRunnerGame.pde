//ANGIE LIU

// Set up the images, buttons, fonts, screen sizes

//images
PImage titleScreen;

//font
PFont PixelFont;

//screens
char screen = 'S'; //S = start screen, M = modes, G = actual game, O = options/settings screen

void setup () {
  size(1600, 900);
  
  //font setup
  PixelFont = createFont("PixelFont.ttf", 32);
  textFont(PixelFont);
  
  titleScreen = loadImage("titleScreen.png");
}

void draw() {
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

void startScreen () {
  image(titleScreen, 0, 0);
  
  textAlign(CENTER, CENTER);
  textMode(CENTER);
  textSize(100);
  text("Untitled Runner Game", 800, 100);
  textSize(50);
  text("By Angie, Grace, & Ryan", 800, 150);
  textSize(100);
  text("Play", 800, 600);
}

void modeScreen () {
  image(titleScreen, 0, 0);
  
  text ("Modes", 800, 100);
}

void gameScreen() {}

void settingsScreen() {}

void mousePressed() {}

void keyPressed() {}
