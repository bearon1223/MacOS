class textFeild {
  String result = ""; 
  boolean pressed = false, correct;
  window window;
  int textTimer = 0;
  float x, y, w, h;

  textFeild(window w) {
    window = w;
  }

  textFeild(float xb, float yb, float wb, float hb) {
    x = xb;
    y = yb;
    w = wb;
    h = hb;
    correct = false;
  }

  void render(window w) {
    textAlign(CORNER, CORNER);
    fill(0); 
    text(result, w.x + 10, w.y + 30, w.w - 10, w.h - 10);
    if (keyPressed && ((!pressed) || (textTimer > 50 && keyCode != SHIFT)) && keyCode != SHIFT) {
      result = result + key;
      pressed = true;
    } else if (!keyPressed && pressed) {
      pressed = false;
      textTimer = 0;
    } else if (keyPressed && keyCode == SHIFT) {
      textTimer = 0;
    } else if (keyPressed && (keyCode == BACKSPACE || keyCode == DELETE)) {
      result = "";
    } else if (keyPressed) {
      textTimer++;
    }
  }

  void render() {
    textAlign(CORNER, CORNER);
    fill(0); 
    text(result, x + 10, y, w - 10, h);
    if (keyPressed && ((!pressed) || (textTimer > 50 && keyCode != SHIFT)) && keyCode != SHIFT) {
      result = result + key;
      pressed = true;
    } else if (!keyPressed && pressed) {
      pressed = false;
      textTimer = 0;
    } else if (keyPressed && keyCode == SHIFT) {
      textTimer = 0;
    } else if (keyPressed && (keyCode == BACKSPACE || keyCode == DELETE)) {
      result = "";
    } else if (keyPressed) {
      textTimer++;
    }
  }

  void render(String correctText) {
    textAlign(CORNER, CORNER);
    fill(0); 
    text(result, x + 10, y, w - 10, h);
    if (keyPressed && ((!pressed) || (textTimer > 50 && keyCode != SHIFT)) && keyCode != SHIFT) {
      if (trim(result) != correctText) {
        result = result + key;
      }
      pressed = true;
    } else if (!keyPressed && pressed) {
      pressed = false;
      textTimer = 0;
    } else if (keyPressed && keyCode == SHIFT) {
      textTimer = 0;
    } else if (keyPressed && (keyCode == BACKSPACE || keyCode == DELETE)) {
      result = "";
    } else if (keyPressed) {
      textTimer++;
    } else if (trim(result) == correctText) {
      correct = true;
    }
  }
}
