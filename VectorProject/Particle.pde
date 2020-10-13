class Particle {

  // Properties
  PVector position; // Where it is
  PVector velocity; // Change of location overtime
  PVector acceleration;
  float life;
  color c;

  // Constructor
  Particle() {
    position = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0.001, 0); // Small quantities
    life = random(50, 255);
    c = color(random(255), random(255), random(255));
  }

  // Newton's second law
  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
    velocity.limit(3);

    PVector mouse = new PVector(mouseX, mouseY);
    mouse.sub(position);
    mouse.setMag(5);
    acceleration = mouse;
  }
  void changeColor() {
  life = random(50, 200);
  }
  
  // Methods
  void display() { 
    noStroke();
    fill(c, life);
    ellipse(position.x, position.y, 50, 50);
  }
  void moveParticle() {
    position.add(velocity);
  } 

  void checkEdges() {
    if (position.x > width) {
      position.x = 0;
    } else if (position.x < 0) {
      position.x = width;
    }

    if (position.y > height) {
      position.y = 0;
    } else if (position.y < 0) {
      position.y = height;
    }
    if (position.y > height) {
      velocity.y *= -1;
      position.y = height;
    }
  }
}
