import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Macintosh_OS_1 extends PApplet {

PImage appleW;
float type = 1;
float mx = 0;
float my = 0;
float pmx = 0;
float pmy = 0;

public void setup(){
  
  appleW = loadImage("white apple logo.jpg");
  surface.setTitle("macOS 1");
}

public void draw(){
  background(0);
  noCursor();
  mx = mouseX;
  my = mouseY;
  pmx = pmouseX;
  pmy = pmouseY;
  macOS();
}
class button {
  
}
class dropmenu {
  dropmenu(float x, float y, float type){}
}
float startup_timer = 0; 
float time_to_load = random(500, 1020);
//float time_to_load = 1;
boolean dropopen = false, isSettingsOpen = false;

public void startup() {
  background(0);
  image(appleW, (width/2) - (100*1.7777777f) / 2, height / 2 - 50, 100*1.7777777f, 100);
}

public void backgrounds(float wbg) {
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

public void macCursor() {
  fill(0);
  stroke(255);
  triangle(mx, my, mx, my + 10, mx+8, my+7);
  fill(0);
  stroke(255);
  triangle(pmx, pmy, pmx, pmy + 10, pmx+8, pmy+7);
  noStroke();
}

public void appleBarLogo(float x, float y, float sx) {
  float sy = sx;
  int c = 200;
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

public void bar() {
  fill(200);
  rect(0, 0, width, 20);
}

window settings = new window(200, 200, 0, isSettingsOpen);

public void macOS() {
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

public boolean isMouseInside(float x, float y, float w, float h) {
  boolean isInside = false;
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    isInside = true;
  } else {
    isInside = false;
  }
  return isInside;
}

class window {
  float x, y, wt, w, ws;
  boolean io;
  window(float startingx, float startingy, float windowType, boolean isOpen) {
    x = startingx;
    y = startingy;
    wt = windowType;
    io = isOpen;
    ws = 0;
    if (windowType == 0) {
      w = 400;
    }
  }

  public void icon() {
    if (wt == 0) {
      fill(150);
      rect(-100, -100, 100, 100, 5);
    }
  }

  public void buttons(float x, float y, float wst) {
    if (isMouseInside(x, y + 20, 20, 20) && wt == 0 && mousePressed) {
      ws = wst;
    }
  }

  public void mousemovement() {
    if (pmx > x && pmx < x + w && pmy > y && pmy < y + 20 && mousePressed) {
      x = pmx - w / 2;
      y = pmy - 10;
    }
  }

  public void render() {
    io = isSettingsOpen;
    if (io) {
      if (wt == 0) {
        fill(230);
        rect(x, y, w, 300);
        fill(200);
        rect(x, y, w, 20);
        fill(255, 50, 50);
        ellipse(x + 10, y + 10, 8, 8);
        if (isMouseInside(x + 5, y + 5, 16, 16) && mousePressed) {
          isSettingsOpen = false;
        }
        if (ws == 0) {
          fill(0, 187, 255);
          rect(x + 10, y + 30, 20, 20);
          buttons(x + 10, y + 10, 1);
        } else if (ws == 1) {
          fill(255, 100, 100);
          rect(x + 10, y + 60, 20, 20);
          if(isMouseInside(x + 10, y + 60, 20, 20) && mousePressed){
            type = 3;
          }
          fill(100, 255, 100);
          rect(x + 40, y + 60, 20, 20);
          if(isMouseInside(x + 40, y + 60, 20, 20) && mousePressed){
            type = 2;
          }
          fill(100, 100, 255);
          rect(x + 70, y + 60, 20, 20);
          if(isMouseInside(x + 70, y + 60, 20, 20) && mousePressed){
            type = 4;
          }
          fill(255, 100, 255);
          rect(x + 100, y + 60, 20, 20);
          if(isMouseInside(x + 100, y + 60, 20, 20) && mousePressed){
            type = 5;
          }
          fill(100, 255, 255);
          rect(x + 130, y + 60, 20, 20);
          if(isMouseInside(x + 130, y + 60, 20, 20) && mousePressed){
            type = 6;
          }
          fill(255, 255, 100);
          rect(x + 160, y + 60, 20, 20);
          if(isMouseInside(x + 160, y + 60, 20, 20) && mousePressed){
            type = 7;
          }
        }
      }
    }
  }
}

  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Macintosh_OS_1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
