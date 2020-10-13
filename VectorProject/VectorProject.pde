Particle[] particles = new Particle[100];
PVector gravity = new PVector (0.2, 0.3);
PVector friction = new PVector(0.2, 0);

void setup() {
  size(800, 800);
  // Initializing particles
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
    gravity.normalize();
  }
}

void draw() {
  background(255);
  for (int i = 0; i < particles.length; i++) {
    particles[i].display();
    particles[i].update();
    particles[i].changeColor();
    particles[i].applyForce(gravity);
    particles[i].moveParticle();
    particles[i].applyForce(friction);
  }
}
