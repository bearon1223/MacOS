class textFeild {
  float x, y, sx, sy, timesKeyPressed = 0;
  String[] textEntered = {
    "NO"
  };
  boolean pressed = false;
  textFeild(float ix, float iy, float isx, float  isy) {
    x = ix;
    y = iy;
    sx = isx;
    sy = isy;
  }
  void typing() {
    if (keyPressed && !pressed) {
      if (key != BACKSPACE) {
        timesKeyPressed++;;
        textEntered = splice(textEntered, str(key), int(timesKeyPressed));
      } else if(key == BACKSPACE){
        timesKeyPressed--;
      }
      pressed = true;
    } else if (!keyPressed && pressed) {
      pressed = false;
    }
    textEntered = splice(textEntered, str(key), int(timesKeyPressed));
  }

  void render() {
    fill(200, 200, 200, 200);
    rect(x, y, sx, sy);
    textSize(15);
    textAlign(CORNER, CORNER);
    fill(255);
    for (int i = 0; i > timesKeyPressed; i++) {
      text(textEntered[i], x + (i * 10), y);
    }
  }
}
