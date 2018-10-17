boolean isMouseInside(float x, float y, float w, float h) {
  boolean isInside = false;
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    isInside = true;
  } else {
    isInside = false;
  }
  return isInside;
}

class window {
  float x, y, wt, w, ws;
  boolean io;
  window(float startingx, float startingy, float windowType, boolean isOpen) {
    x = startingx;
    y = startingy;
    wt = windowType;
    io = isOpen;
    ws = 0;
    if (windowType == 0) {
      w = 400;
    }
  }

  void icon() {
    if (wt == 0) {
      fill(150);
      rect(-100, -100, 100, 100, 5);
    }
  }

  void buttons(float x, float y, float wst) {
    if (isMouseInside(x, y + 20, 20, 20) && wt == 0 && mousePressed) {
      ws = wst;
    }
  }

  void mousemovement() {
    if (pmx > x && pmx < x + w && pmy > y && pmy < y + 20 && mousePressed) {
      x = pmx - w / 2;
      y = pmy - 10;
    }
  }

  void render() {
    io = isSettingsOpen;
    if (io) {
      if (wt == 0) {
        fill(230);
        rect(x, y, w, 300);
        fill(200);
        rect(x, y, w, 20);
        fill(255, 50, 50);
        ellipse(x + 10, y + 10, 8, 8);
        if (isMouseInside(x + 5, y + 5, 16, 16) && mousePressed) {
          isSettingsOpen = false;
        }
        if (ws == 0) {
          fill(0, 187, 255);
          rect(x + 10, y + 30, 20, 20);
          buttons(x + 10, y + 10, 1);
        } else if (ws == 1) {
          fill(255, 100, 100);
          rect(x + 10, y + 60, 20, 20);
          fill(100, 255, 100);
          rect(x + 40, y + 60, 20, 20);
          fill(100, 100, 255);
          rect(x + 70, y + 60, 20, 20);
          fill(255, 100, 255);
          rect(x + 100, y + 60, 20, 20);
          fill(100, 255, 255);
          rect(x + 130, y + 60, 20, 20);
          fill(255, 255, 100);
          rect(x + 160, y + 60, 20, 20);
        }
      }
    }
  }
}
