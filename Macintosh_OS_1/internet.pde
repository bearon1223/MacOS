class web {
  boolean gearweb;
  web(){
    gearweb = false;
  }
  
  void searchEngine(window w){
    fill(10, 10, 255);
    text("aronweb.com/gears3frontier.html", w.x+20, w.y+40);
    fill(255, 255, 255, 100);
    rect(w.x+20,w.y+30,250,15);
    if(isMouseInside(w.x+20,w.y+30,250,15) && mousePressed){
      gearweb = true;
    }
    if(gearweb){
      gearReveiw(w);
    }
  }
  
  void gearReveiw(window w) {
    fill(255);
    rect(w.x, w.y + 20, w.w, w.h - 20);
  }
}
