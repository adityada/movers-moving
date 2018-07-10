int width = 1280;
int height = 720;

Mover m[] = new Mover[100];

void settings() {
 size(width, height); 
 for (int i = 0; i < m.length; i++) {
  m[i] = new Mover(); 
 }
}

void draw() {
 background(255);
 for (int i = 0; i < m.length; i++) {
   m[i].update();
   m[i].draw();
 }
}
