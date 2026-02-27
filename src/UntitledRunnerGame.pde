// Set up the images, buttons, fonts, screen sizes

//images
PImage titleScreen;

//font
PFont PixelFont;

void setup () {
  size(1600, 900);
  
  //font setup
  PixelFont = createFont("PixelFont.ttf", 32);
  textFont(PixelFont);
  
  titleScreen = loadImage("titleScreen.png");
}

void draw() {
  image(titleScreen, 0, 0);
  
  textAlign(CENTER, CENTER);
  textMode(CENTER);
  textSize(100);
  text("Untitled Runner Game", 800, 100);
}
