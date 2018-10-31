class textFeild {
  String result = ""; 
  boolean pressed = false;
  window window;
  int textTimer = 0;

  textFeild(window w) {
    window = w;
  }

  void render(window w) {
    textAlign(CORNER, CORNER);
    fill(0); 
    text(result, w.x + 10, w.y + 30, 280, 550);
    if (keyPressed && ((!pressed) || (textTimer > 50 && keyCode != SHIFT)) && keyCode != SHIFT) {
      result = result + key;
      pressed = true;
    } else if (!keyPressed && pressed) {
      pressed = false;
      textTimer = 0;
    } else if (keyPressed) {
      textTimer++;
    }
  }
}
