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
  float x, y, wt, w, ws, h;
  boolean ioset, ioapp, ioflap = false, io = false, search = false;
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
    h = 600;
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
    if (pmx > x + 5 + 16 && pmx < x + w && pmy > y && pmy < y + 20 && mousePressed) {
      x = pmx - w / 2;
      y = pmy - 10;
    }
    if (isMouseInside(x + 5, y + 5, 16, 16) && mousePressed && wt == 1) {
      isAppstoreOpen = false;
    }
    if (isMouseInside(x + 5, y + 5, 16, 16) && mousePressed && wt == 0) {
      isSettingsOpen = false;
    }
    if (isMouseInside(x + 5, y + 5, 16, 16) && mousePressed && wt == 2) {
      flappyOpen = false;
    }
    if (isMouseInside(x + 5, y + 5, 16, 16) && mousePressed && wt == 3) {
      notesOpen = false;
    }
    if (isMouseInside(x + 5, y + 5, 16, 16) && mousePressed && wt == 4) {
      webOpen = false;
      if (isMouseInside(x, y, w, h) && mousePressed && isPriority != wt) {
        isPriority = wt;
      }
    }
  }

  void render(boolean open) {
    io = open;
    if (io) {
      if (wt == 0) {
        h = 300;
        fill(230);
        rect(x, y, w, h);

        fill(200);
        rect(x, y, w, 20);
        fill(255, 50, 50);
        ellipse(x + 10, y + 10, 8, 8);

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
          fill(255, 0, 0);
          rect(x + 190, y + 60, 20, 20);
          if (isMouseInside(x + 190, y + 60, 20, 20) && mousePressed) {
            type = 8;
          }
          fill(0, 255, 0);
          rect(x + 220, y + 60, 20, 20);
          if (isMouseInside(x + 220, y + 60, 20, 20) && mousePressed) {
            type = 9;
          }
          fill(0, 0, 255);
          rect(x + 250, y + 60, 20, 20);
          if (isMouseInside(x + 250, y + 60, 20, 20) && mousePressed) {
            type = 10;
          }
          fill(0);
          rect(x + 280, y + 60, 20, 20);
          if (isMouseInside(x + 280, y + 60, 20, 20) && mousePressed) {
            type = 11;
          }
          fill(255);
          rect(x + 310, y + 60, 20, 20);
          if (isMouseInside(x + 310, y + 60, 20, 20) && mousePressed) {
            type = 12;
          }
          fill(255);
          rect(x + 340, y + 60, 20, 20);
          if (isMouseInside(x + 340, y + 60, 20, 20) && mousePressed) {
            type = 13;
          }

          fill(255);
          rect(x + 370, y + 60, 20, 20);
          if (isMouseInside(x + 370, y + 60, 20, 20) && mousePressed) {
            type = 14;
          }
          fill(255);
          rect(x + 10, y + 90, 20, 20);
          if (isMouseInside(x + 10, y + 90, 20, 20) && mousePressed) {
            type = 15;
          }
          fill(255);
          rect(x + 30, y + 90, 20, 20);
          if (isMouseInside(x + 30, y + 90, 20, 20) && mousePressed) {
            type = 16;
          }
        }
      }
    } 
    if (io && wt == 1) {
      fill(230);
      h = 300;
      rect(x, y, w, h);
      fill(200);
      rect(x, y, w, 20);
      fill(255, 50, 50);
      ellipse(x + 10, y + 10, 8, 8);

      rect(x + 30, y + 20, 20, 20);
      if (isMouseInside(x + 30, y + 20, 20, 20) && wt == 1 && mousePressed) {
        hasFlappy = true;
      }
    }
    if (io && wt == 2) {
      w = 700;
      h = 600;
      fill(0, 187, 255);
      rect(x, y, w, h);
      fill(200);
      rect(x, y, w, 20);
      fill(255, 50, 50);
      ellipse(x + 10, y + 10, 8, 8);
    }
    if (io && wt == 3) {
      w = 300;
      h = 600;
      fill(230);
      rect(x, y, w, h);
      fill(200);
      rect(x, y, w, 20);
      fill(255, 50, 50);
      ellipse(x + 10, y + 10, 8, 8);
    }
    if (io && wt == 4) {
      w = 800;
      h = 600;
      fill(230);
      rect(x, y, w, h);
      fill(200); 
      rect(x, y, w, 20);
      fill(255, 50, 50); 
      ellipse(x + 10, y + 10, 8, 8);

      textAlign(CENTER, CENTER);
      textSize(50);
      if (!search) {
        fill(0);
        text("Me Search", x + w/2, y + h / 2 - 20);
      }
      if (isMouseInside(x+50, y+ h/2 + 30, 700, 50) && mousePressed && !search) {
        search = true;
      }
      if (!search) {
        fill(240);
        rect(x + 50, y + h / 2 + 30, 700, 50);
      }
      if (search) {
        fill(0);
        text("Error: 404 Page not found", x + 400, y + 300);
      }
      textSize(12);
    }
  }
}
