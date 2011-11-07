


SucraSys ps;

void setup() {
  size(screenWidth, screenHeight, P2D);
  colorMode(RGB);
  particleImages = new PImage[5];
  particleImages[0] = loadImage('sucra1.png');
  particleImages[1] = loadImage('sucra2.png');
  particleImages[2] = loadImage('sucra3.png');
  particleImages[3] = loadImage('sucra4.png');
  particleImages[4] = loadImage('sucra5.png');
  ps = new SucraSys(1000, new PVector(width/2,height/2,0));
}


void draw() {
  background(0,0);
  ps.update();
  ps.render();
  if (frameCount % 100 < 90) {
    particleRandomMovement = 0;
  } else {
        particleRandomMovement = 1;
  }
  //println("framerate: "+frameRate);
}



void mousePressed() {
  ps.repel(mouseX, mouseY, 50.3f);
}

void mouseDragged() {
  ps.repel(mouseX, mouseY, 25.3f);
}
  
