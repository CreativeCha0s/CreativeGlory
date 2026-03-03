//GRACE PERRY

class Button {
  String label;
  float x, y, w, h;

  Button(String label, float x, float y, float w, float h) {
    this.label = label;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void display() {
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  boolean clicked() {
    return (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2 && mousePressed);
  }
}
