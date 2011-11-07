


SucraSys ps;

void setup() {
  size(screenWidth, screenHeight, P2D);
  colorMode(RGB);
  ps = new SucraSys(400, new PVector(width/2,height/2,0));
  particleImage = loadImage('sucra.png');
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

void mouseMoved() {
  ps.repel(mouseX, mouseY, 5.3f);
}
  
