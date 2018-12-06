class web {
  boolean gearweb, searched;
  web(){
    gearweb = false;
    searched = false;
  }
  
  void searchEngine(window w){
    fill(10, 10, 255);
    text("aronweb.com/gears3frontier.html", w.x+20, w.y+40);
    fill(255, 255, 255, 100);
    rect(w.x+20,w.y+30,250,15);
    if(isMouseInside(w.x+20,w.y+30,250,15) && mousePressed){
      gearweb = true;
      searched = true;
    }
    if(gearweb && searched){
      gearReveiw(w);
    } else {
      gearweb = false;
    }
  }
  
  void searchbar(window w){
    float x = w.x;
    float y = w.y + 20;
    fill(230);
    rect(x, y, w.w, 20);
    fill(0);
    triangle(x + 10, y + 4, x + 3, y + 9, x + 10, y + 16);
    stroke(0);
    strokeWeight(2);
    line(x + 10, y + 9, x + 15, y + 9);
    noStroke();
    strokeWeight(1);
    if(isMouseInside(x+3,y+4,5+7,16) && mousePressed){
      searched = false;
    }
  }
  
  void gearReveiw(window w) {
    float x = w.x;
    float y = w.y + 20;
    fill(255);
    rect(x, y, w.w, w.h - 20);
    searchbar(w);
  }
}
