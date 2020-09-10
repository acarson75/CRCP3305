// Declare objects as a global variable
Ball myBall;
Box myBox;

void setup() {
  size(500, 500);
  background(255);
  smooth();
  // Initialize
  myBall = new Ball();
  myBox = new Box();
}
void draw() {
  background(255);
  myBox.display();
  myBall.display();
  myBall.move();
}
