// sound
import processing.sound.*;
SoundFile background;
SoundFile jump;
SoundFile crash;

// pictures
PImage conePicLoaded, barrelLoaded, dogLoaded;
PImage backgroundImg, dieImg, startImg;

Player player;
ArrayList <Obstacles> obstacles = new ArrayList<Obstacles>();
int state = 0;

// calling button
Button startButton;
Button home;

// setup
void setup() {
  size (1400, 800);

  //screen play
  startImg = loadImage("City.png");
  startImg.resize(1400, 800);

  // backgroung picture
  backgroundImg = loadImage("City.jpg");
  backgroundImg.resize(1400, 800);

  // cone picture
  conePicLoaded = loadImage("cone.png");
  conePicLoaded.resize(250, 250);

  // barrel picture
  barrelLoaded = loadImage("barrel.png");
  barrelLoaded.resize(250, 250);

  // dog picture
  dogLoaded = loadImage("dog.png");
  dogLoaded.resize(250, 250);

  // end page when you crash
  dieImg = loadImage("die.png");
  dieImg.resize(1400, 800);

  // buttons
  startButton = new Button(width/2 - 150, height - 250, 300, 125, color(255), 28);
  home = new Button(width/2 - 600, height/2 - 200, 300, 125, color(255), 28);

  // player + obstacles
  player = new Player();
  obstacles.add(new Obstacles(int(random(1, 4))));

  // sounds
  background = new SoundFile(this, "background.wav");
  jump = new SoundFile (this, "jump.wav");
  crash = new SoundFile (this, "crash.wav");
}

void draw() {
  switch(state) {
  case 0:
    background(startImg);
    startButton.render();
    startButton.checkMouse();
    textSize(50);
    fill(0);
    text("PLAY", 650, 630);
    if (startButton.isPressed() == true) {
      state = 1;
    }

    break;
  case 1:
    background (backgroundImg);
    if (background.isPlaying() == false) {
      background.play();
    }

    // move player
    player.move();
    println(player.bottomBound);

    for (int i = 0; i < obstacles.size(); i++) {
      obstacles.get(i).move();
      obstacles.get(i).updateBounds();
      obstacles.get(i).collision();
    }

    // randomized obstacles 
    for (int i = 0; i < obstacles.size(); i++) {
      if (obstacles.get(i).x == width / 2 - 200) {
        obstacles.add(new Obstacles(int(random(1, 4))));
      }
    }

    // delete offscreen
    for (int i = 0; i < obstacles.size(); i++) {
      if (obstacles.get(i).x < 0) {
        obstacles.remove(i);
      }
    }

    // road
    noStroke();
    fill (#545D6A);
    rect (0, height - 200, width, 200);

    for (int i = 0; i < obstacles.size(); i++) {
      obstacles.get(i).show();
      obstacles.get(i).updateBounds();
      obstacles.get(i).collision();
    }

    // draw player
    player.show();
    player.updateBounds();

    break;

  case 2:
    image(dieImg, 0, 0);
    home.render();
    home.checkMouse();
    textSize(50);
    fill(0);
    text("HOME", width/2 - 520, 280);
    if (home.isPressed() == true) {
      state = 0;
      obstacles.clear();
      setup();
    }

    break;
  }
}

void keyPressed() {

  if (keyCode == 32) {
    if (player.isGrounded) {
      player.jump();
      jump.play();
    }
  }
}
