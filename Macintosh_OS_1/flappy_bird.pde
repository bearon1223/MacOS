float birdxb = 100;
float birdyb = 100;

void flappyBirdGame(window window) {
  scene(window);
}

void scene(window f) {
  obstical(f);
  bird(f);
}

void obstical(window f) {
}

void bird(window f) {
  float birdx = birdxb + f.x;
  float birdy = birdyb + f.y + 20;
  ellipse(birdx, birdy, 10, 10);
}
