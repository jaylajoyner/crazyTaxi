// make player
class Player {

  float w, h, ground, x, y, gravity, velocity;
  boolean isGrounded;
  PImage carImage;

  float rightBound;
  float bottomBound;
  float leftBound;

  Player() {
    w = 100;
    h = 50;
    x = 150;
    ground = height - 200;
    y = 100;
    gravity -= 2.2;
    velocity = 0;

    isGrounded = false;

    carImage = loadImage("taxi.png");
    carImage.resize(300, 400);
  }

  void jump() {
    velocity = 0;
    velocity += 35;
  }

  void move() {
    velocity += gravity;
    y -= velocity;

    if (y + h >= ground) {
      isGrounded = true;
      y = ground - h;
    } else {
      isGrounded = false;
    }
  }

  void updateBounds() {
    bottomBound = y + h;
    rightBound = x + w;
    leftBound = x;
  }

  void show() {
    image(carImage, x-100, y-165);
    //rect(x,y,w,h);
  }
}
