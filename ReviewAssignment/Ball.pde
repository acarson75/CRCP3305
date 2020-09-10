class Ball {
  // Variable
  float x, y, speedX, speedY;
  boolean button = false;
  int orange = color(255, 118, 5);
  int blue = color(5, 97, 255);

  // Constructors
  Ball() {
    x = width/2;
    y = height/2;
    speedX = 2;
    speedY = 3;
  }
  // Display ball
  void display() {
    mousePressed();
    noStroke();
    ellipse(x, y, 50, 50);
    mousePressed();
  }

  void mousePressed() {
    if (!button) {
      fill(orange);
    } else {
      fill(blue);
    }
    button = false;
  }
  // Moving ball
  void move() {
    x = x + speedX;
    y = y + speedY;

    if (x > width/2 + 100 || x < width/2 - 100) {
      speedX = -speedX;
    }
    if (y < height/2 - 100 || y > height/2 + 100) {
      speedY = -speedY;
    }
  }
}
