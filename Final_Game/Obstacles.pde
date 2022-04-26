class Obstacles {

  float w, h, x, y, speed;
  PImage obstacleImage, barrelImage, dogImage;


  float leftBound;
  float topBound;
  float rightBound;

  int id;

  Obstacles(int tempID) {
    w = 50;
    h = 100;
    x = width;
    y = height - 200 - h;
    speed = 10;

    id = tempID;


    obstacleImage = conePicLoaded;
    barrelImage = barrelLoaded;
    dogImage = dogLoaded;
  }

  void move () {
    x -= speed;
  }

  void updateBounds() {
    topBound = y + 5;
    leftBound = x;
    rightBound = x + w/2;
  }

  void collision () {
    if (topBound < player.bottomBound) {
      if (leftBound < player.rightBound) {
        if (rightBound > player.leftBound) {
          state = 2;
          crash.play();
          background.stop();
          println("collided");
        }
      }
    }
  }

  void show() {

    //image(obstacleImage, x - 100, y - 50);
    if (id == 1) {
      image(obstacleImage, x - 100, y - 50);
    }
    if (id == 2) {
      image(barrelImage, x - 100, y - 50);
    }
    if (id == 3) {
      image(dogImage, x - 100, y - 50);
      //rect(x, y, w, h);
    }
  }
}
