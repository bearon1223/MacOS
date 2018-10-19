float birdxb = 700 / 2;
float birdyb = 100;
float g = 0.1;
boolean setup = false;
float birdx;
float birdy;
float y;

void flappyBirdGame(window window) {
  scenes(window);
}

void scenes(window f) {
  obstical(f);
  bird(f);
}

void obstical(window f) {
  float windowx = birdxb + f.x;
  float windowy = (birdyb + f.y + 20);
  
}

void bird(window f) {
  if(!flappyOpen){
    y = 100;
  }
  float windowx = birdxb + f.x;
  float windowy = (birdyb + f.y + 20);
  birdy = windowy + y;
  if (!setup) {
    setup = true;
  } else {
    ellipse(windowx, birdy, 20, 20);
    if (keyPressed && g > 0.1) {
      g = -5;
    }
    if (birdy < windowy + 450) {
      g += 0.25;
    } else {
      g = -2;
    }if (birdy > windowy - 75) {
      g += 0.25;
    } else {
      g = 2;
    }
    y += g;
  }
}
