PImage appleW;
float type = 1;
boolean loggedout = true;
float mx = 0;
float my = 0;
float pmx = 0;
float pmy = 0;
PImage Background1;
PImage Background2;
PImage Background3;
PImage Background4;
static final String CONFIG_FILE = "config.dat";

void setup() {
  size(1000, 1000);
  appleW = loadImage("white apple logo.jpg");
  surface.setTitle("OSX me");
  load();
  Background1 = loadImage("imagebackground1.jpeg");
  Background2 = loadImage("imagebackground2.jpg");
  Background3 = loadImage("imagebackground3.jpg");
  Background4 = loadImage("imagebackground4.jpg");
  frameRate(100);
}

void save() {
  String[] lines = {
    str(type), str(hasFlappy)
  };
  saveStrings(dataFile(CONFIG_FILE), lines);
}

void load() {
  String[] lines = loadStrings(CONFIG_FILE);
  type = float(lines[0]);
  hasFlappy = boolean(lines[1]);
}

void draw() {
  save();
  background(0);
  noCursor();
  mx = mouseX;
  my = mouseY;
  pmx = pmouseX;
  pmy = pmouseY;
  macOS();
}
