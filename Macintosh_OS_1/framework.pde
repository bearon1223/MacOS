float startup_timer = 0; 
float time_to_load = random(500, 1020);
//float time_to_load = 1;
boolean dropopen = false, isSettingsOpen = false;

void startup() {
  background(0);
  image(appleW, (width/2) - (100*1.7777777) / 2, height / 2 - 50, 100*1.7777777, 100);
}

void backgrounds(float wbg) {
  float whichbg = floor(wbg);
  if (whichbg == 1) {
    background(255, 255, 255);
  }
  if (whichbg == 2) {
    background(100, 255, 100);
  }
  if (whichbg == 3) {
    background(255, 100, 100);
  }
  if (whichbg == 4) {
    background(100, 100, 255);
  }
  if (whichbg == 5) {
    background(255, 100, 255);
  }
  if (whichbg == 6) {
    background(100, 255, 255);
  }
  if (whichbg == 7) {
    background(255, 255, 100);
  }
}

void macCursor() {
  fill(0);
  stroke(255);
  triangle(mx, my, mx, my + 10, mx+8, my+7);
  fill(0);
  stroke(255);
  triangle(pmx, pmy, pmx, pmy + 10, pmx+8, pmy+7);
  noStroke();
}

void appleBarLogo(float x, float y, float sx) {
  float sy = sx;
  color c = 200;
  if ((mx > x - sx * 2 && mx < x + sx * 2 && my > y - sy * 2 && my < y + sy && mousePressed) || dropopen) {
    c = color(100, 150, 255);
    isSettingsOpen = true;
    dropopen = true;
  } else {
    c = 200;
  }
  if(!(mx > x - sx * 2 && mx < x + sx * 2 && my > y - sy * 2 && my < y + sy) && mousePressed){
    dropopen = false;
  }
  fill(c);
  rect(x - sx * 2, y - sy * 2, x + sx * 2, y + sy * 2);
  fill(0);
  ellipse(x, y, sx, sy);
  fill(c);
  ellipse(x + sx / 2, y, sx/2, sy/2);
}

void bar() {
  fill(200);
  rect(0, 0, width, 20);
}

window settings = new window(200, 200, 0, isSettingsOpen);

void macOS() {
  if (startup_timer < time_to_load) {
    startup();
    startup_timer++;
  } else {
    noStroke();
    backgrounds(type);
    bar();
    fill(0);
    appleBarLogo(20, 10, 10);
    settings.render();
    settings.mousemovement();
    macCursor();
    //type += 0.01;
  }
}
