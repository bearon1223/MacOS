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
  boolean ioset, ioapp, ioflap = false;
  window(float startingx, float startingy, float windowType, boolean isOpen) {
    x = startingx;
    y = startingy;
    wt = windowType;
    ioset = false;
    ioapp = false;
    boolean f_in_the_chat = isOpen;
    if (f_in_the_chat) {
    }
    ws = 0;
    w = 400;
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
    ioset = isSettingsOpen;
    ioapp = isAppstoreOpen;
    ioflap = flappyOpen;
    if (ioset) {
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
          if (isMouseInside(x + 10, y + 60, 20, 20) && mousePressed) {
            type = 3;
          }
          fill(100, 255, 100);
          rect(x + 40, y + 60, 20, 20);
          if (isMouseInside(x + 40, y + 60, 20, 20) && mousePressed) {
            type = 2;
          }
          fill(100, 100, 255);
          rect(x + 70, y + 60, 20, 20);
          if (isMouseInside(x + 70, y + 60, 20, 20) && mousePressed) {
            type = 4;
          }
          fill(255, 100, 255);
          rect(x + 100, y + 60, 20, 20);
          if (isMouseInside(x + 100, y + 60, 20, 20) && mousePressed) {
            type = 5;
          }
          fill(100, 255, 255);
          rect(x + 130, y + 60, 20, 20);
          if (isMouseInside(x + 130, y + 60, 20, 20) && mousePressed) {
            type = 6;
          }
          fill(255, 255, 100);
          rect(x + 160, y + 60, 20, 20);
          if (isMouseInside(x + 160, y + 60, 20, 20) && mousePressed) {
            type = 7;
          }
        }
      }
    } else if (ioapp && wt == 1) {
      fill(230);
      rect(x, y, w, 300);
      fill(200);
      rect(x, y, w, 20);
      fill(255, 50, 50);
      ellipse(x + 10, y + 10, 8, 8);
      if (isMouseInside(x + 5, y + 5, 16, 16) && mousePressed) {
        isAppstoreOpen = false;
      }
      rect(x + 30, y + 20, 20, 20);
      if (isMouseInside(x + 30, y + 20, 20, 20) && wt == 1 && mousePressed) {
        hasFlappy = true;
      }
    } else if(ioflap && wt == 2){
      w = 700;
      fill(0, 187, 255);
      rect(x, y, w, 600);
      fill(200);
      rect(x, y, w, 20);
      fill(255, 50, 50);
      ellipse(x + 10, y + 10, 8, 8);
      if (isMouseInside(x + 5, y + 5, 16, 16) && mousePressed) {
        flappyOpen = false;
      }
    }
  }
}
