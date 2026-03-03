//GRACE PERRY

class Button {
  String label;
  float x, y, w, h;
  color c1;

  Button(String label, float x, float y, float w, float h, color c1) {
    this.label = label;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c1 = c1;
  }

  void display() {
    rectMode(CENTER);
    fill(c1);
    rect(x, y, w, h);
    fill(255);
    textSize(150);
    text(label, x, y);
    
  }

  boolean clicked() {
    return (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2 && mousePressed);
  }
}
