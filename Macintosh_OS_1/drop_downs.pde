class dropmenu {
  float x, y, t;
  dropmenu(float dx, float dy, float type) {
    x = dx;
    y = dy;
    t = type;
  }

  void render() {
    if (dropopen && t == 0) {
      fill(200);
      rect(x, y, 100, 200);
      fill(0);
      textAlign(CENTER, CENTER);
      text("Settings", x + 50, y + 10);
      stroke(0);
      line(x, y + 20, x + 100, y + 20);
      if(isMouseInside(x, y, 100, 20) && mousePressed){
        isSettingsOpen = true;
      }
      fill(0);
      textAlign(CENTER, CENTER);
      text("App Store", x + 50, y + 30);
      stroke(0);
      line(x, y + 40, x + 100, y + 40);
      if(isMouseInside(x, y + 20, 100, 20) && mousePressed){
        isAppstoreOpen = true;
      }
      fill(0);
      textAlign(CENTER, CENTER);
      text("Log Out", x + 50, y + 50);
      stroke(0);
      line(x, y + 60, x + 100, y + 60);
      if(isMouseInside(x, y + 40, 100, 20) && mousePressed){
        loggedout = true;
      }
      fill(0);
      textAlign(CENTER, CENTER);
      text("Shut Down", x + 50, y + 70);
      stroke(0);
      line(x, y + 80, x + 100, y + 80);
      if(isMouseInside(x, y + 60, 100, 20) && mousePressed){
        shuttingdown = true;
      }
    } else {
    }
  }
}
