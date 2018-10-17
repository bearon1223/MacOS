PImage appleW;
float mx = 0;
float my = 0;
float pmx = 0;
float pmy = 0;

void setup(){
  size(1000, 1000);
  appleW = loadImage("white apple logo.jpg");
  surface.setTitle("macOS 1");
}

void draw(){
  background(0);
  noCursor();
  mx = mouseX;
  my = mouseY;
  pmx = pmouseX;
  pmy = pmouseY;
  macOS();
}
