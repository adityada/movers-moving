class Mover {
 PVector vel = new PVector(0, 0);
 PVector loc = new PVector(random(width), random(height));
 PVector acc = new PVector(0, 0);
 float mass = random(0.5,4);
 int bounceFactor = 1;
 
 void checkEdges() {
  if(loc.y - (mass*10)/2 > height) {
   loc.y = height - (mass*10)/2;
   vel.y*=-1;
  }
  
  if(loc.x > width + (mass*10)/2 || loc.x < 0 + (mass*10)/2) {
   vel.x*=-1;
   bounceFactor *= -1;
  }
  
 }
 
 void applyForce(PVector f) {
  PVector force = PVector.div(f, mass);
  acc.add(force);
 }
 
 void update() {
  PVector gravity = new PVector(0, 0.1*mass);
  applyForce(gravity);
  
  PVector wind = new PVector(0.1*mass*bounceFactor, 0);
  applyForce(wind);
  
  float c = 0.001;
  float dragMag = vel.magSq() * c;
  PVector drag = vel.get().normalize();
  drag.mult(-dragMag);
  applyForce(drag);
  
  PVector friction = vel.get().normalize();
  float frictionC = -0.01;
  friction.mult(frictionC);
  applyForce(friction);
   
  vel.add(acc);
  loc.add(vel);
  acc.mult(0);
  checkEdges();
 }
 
 void draw() {
  fill(0, 0, 0, map(mass, 0.5, 5, 0, 100));
  ellipse(loc.x, loc.y, mass*10, mass*10);
 }
 
}
