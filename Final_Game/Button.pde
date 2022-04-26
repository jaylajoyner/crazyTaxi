class Button {

  //button var's
  int x;
  int y;
  int w;
  int h;
  int c;
  int d;

  //constructor
  Button(int tempX, int tempY, int tempW, int tempH, color tempC, int tempD) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    c = tempC;
    d = tempD;
  }

  //draws the button
  void render() {
    fill(c);
    rect(x, y, w, h, d);
  }

  //checks if button is being pressed
  boolean isPressed() {
    if (mousePressed == true && mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) {
      return true;
    } else {
      return false;
    }
  }

  void checkMouse() {
    if ( mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h ) {
      c = 204;
    } else {
      c = 255;
    }
  }
}
