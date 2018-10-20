float birdxb = 700 / 2;
float birdyb = 100;
float g = 0.1;
boolean setup = false;
float birdx;
float birdy;
float y;
float pipex = 700;

void flappyBirdGame(window window) {
  scenes(window);
}

void scenes(window f) {
  obstical(f);
  bird(f);
}

void obstical(window f) {
  float windowx = pipex + f.x;
  float windowy = f.y + 20;
  rect(windowx -11, windowy + 1, 10, 570);
  if(pipex < 10) {
    pipex = 700;
  } else {
    pipex--;
  }
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
    if (birdy < f.y + 570) {
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
