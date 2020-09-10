class Box {
  // Variables
  boolean overBox = false;
  boolean locked = false;
  float r = 90;
  float g = 240;
  float b = 200;
  float speedB, speedR, speedG;
  float bx;
  float by;
  int boxSize = 250;

  // Constructor
  Box() {
    speedG = 0.8;
    speedB = 0.8;
    speedR = 0.4;
  }
  void display() {
    fill(r, g, b);
    noStroke();
    bx = width/2.0;
    by = height/2.0;
    rectMode(CENTER);

    // Hovering
    if (mouseX > bx-boxSize/2 && mouseX < bx+boxSize/2 && mouseY > by-boxSize/2 && mouseY < by+boxSize/2) {
      overBox = true;
      if (!locked) {
        stroke(0);
        strokeWeight(2);
        fill(220);
      }
    } else {
      b = b + speedB;

      if (b >= 255 || b <= 20) {
        speedB = -speedB;
      }
      r = r + speedR;

      if (r >= 255 || r <= 20) {
        speedR = -speedR;

        overBox = false;
      }
    }
    // Display box
    stroke(255);
    strokeWeight(3);
    rect(bx, by, boxSize, boxSize, 50);
  }
}
