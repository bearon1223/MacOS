void paint(window w){
  drawit(w);
}

void drawit(window f){
  if(mousePressed && isMouseInside(f.x, f.y, f.w, f.y + 600)){
    ellipse(mouseX, mouseY, 10, 10);
  }
}
