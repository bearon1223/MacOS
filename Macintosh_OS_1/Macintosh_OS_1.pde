PImage appleW;
float type = 1;
boolean loggedout = true;
float mx = 0;
float my = 0;
float pmx = 0;
float pmy = 0;
static final String CONFIG_FILE = "config.dat";

void setup(){
  size(1000, 1000);
  appleW = loadImage("white apple logo.jpg");
  surface.setTitle("macOS me");
  load();
}

void save(){
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

void draw(){
  save();
  background(0);
  noCursor();
  mx = mouseX;
  my = mouseY;
  pmx = pmouseX;
  pmy = pmouseY;
  macOS();
}
