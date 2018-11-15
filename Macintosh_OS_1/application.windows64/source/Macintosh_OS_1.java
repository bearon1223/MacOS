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
boolean loggedout = true;
float mx = 0;
float my = 0;
float pmx = 0;
float pmy = 0;
PImage Background1;
PImage Background2;
PImage Background3;
PImage Background4;
PImage Background5;
static final String CONFIG_FILE = "config.dat";

public void setup() {
  
  appleW = loadImage("white apple logo.jpg");
  surface.setTitle("OSX me");
  load();
  Background1 = loadImage("imagebackground1.jpeg");
  Background2 = loadImage("imagebackground2.jpg");
  Background3 = loadImage("imagebackground3.jpg");
  Background4 = loadImage("imagebackground4.jpg");
  frameRate(100);
  //Background5 = loadImage("imagebackground5.jp2");
}

public void save() {
  String[] lines = {
    str(type), str(hasFlappy)
  };
  saveStrings(dataFile(CONFIG_FILE), lines);
}

public void load() {
  String[] lines = loadStrings(CONFIG_FILE);
  type = PApplet.parseFloat(lines[0]);
  hasFlappy = PApplet.parseBoolean(lines[1]);
}

public void draw() {
  save();
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
  float x, y, t;
  dropmenu(float dx, float dy, float type) {
    x = dx;
    y = dy;
    t = type;
  }

  public void render() {
    if (dropopen && t == 0) {
      fill(200);
      rect(x, y, 100, 200);
      fill(0);
      textAlign(CENTER, CENTER);
      text("Settings", x + 50, y + 10);
      stroke(0);
      line(x, y + 20, x + 100, y + 20);
      if(isMouseInside(x, y, 100, 20) && mousePressed){
        isSettingsOpen = true;
      }
      fill(0);
      textAlign(CENTER, CENTER);
      text("App Store", x + 50, y + 30);
      stroke(0);
      line(x, y + 40, x + 100, y + 40);
      if(isMouseInside(x, y + 20, 100, 20) && mousePressed){
        isAppstoreOpen = true;
      }
      fill(0);
      textAlign(CENTER, CENTER);
      text("Log Out", x + 50, y + 50);
      stroke(0);
      line(x, y + 60, x + 100, y + 60);
      if(isMouseInside(x, y + 40, 100, 20) && mousePressed){
        loggedout = true;
      }
      fill(0);
      textAlign(CENTER, CENTER);
      text("Shut Down", x + 50, y + 70);
      stroke(0);
      line(x, y + 80, x + 100, y + 80);
      if(isMouseInside(x, y + 60, 100, 20) && mousePressed){
        shuttingdown = true;
      }
    } else {
    }
  }
}
float birdxb = 700 / 2;
float birdyb = 100;
float g = 0.1f;
boolean setup = false;
float birdx;
float birdy;
float y;
float pipex = 700;

public void flappyBirdGame(window window) {
  scenes(window);
}

public void scenes(window f) {
  obstical(f);
  bird(f);
}

public void obstical(window f) {
  float windowx = pipex + f.x;
  float windowy = f.y + 20;
  rect(windowx -11, windowy + 1, 10, 570);
  if(pipex < 10) {
    pipex = 700;
  } else {
    pipex--;
  }
}

public void bird(window f) {
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
    if (keyPressed && g > 0.1f) {
      g = -5;
    }
    if (birdy < f.y + 570) {
      g += 0.25f;
    } else {
      g = -2;
    }if (birdy > windowy - 75) {
      g += 0.25f;
    } else {
      g = 2;
    }
    y += g;
  }
}
float startup_timer = 0, shutdown_timer = 0; 
float time_to_load = random(500, 1020), time_to_shutdown = random(500, 1020);
float startx = 0;
float starty = 0;
//float time_to_load = 1;
boolean dropopen = false, isSettingsOpen = false, shuttingdown = false, isAppstoreOpen = false, hasFlappy = true, flappyOpen = false, notesOpen = false, isPaintOpen = false, webOpen = false;
float isPriority = 0;

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
  if (whichbg == 8) {
    background(255, 0, 0);
  }
  if (whichbg == 9) {
    background(0, 255, 0);
  }
  if (whichbg == 10) {
    background(0, 0, 255);
  }
  if (whichbg == 11) {
    background(0);
  }
  if (whichbg == 12) {
    background(255);
  }
  if (whichbg == 13) {
    image(Background1, 0, 20, 1000, 980);
  }
  if (whichbg == 14) {
    image(Background2, 0, 20, 1000, 980);
  }
  if (whichbg == 15) {
    image(Background3, 0, 20, 1000, 980);
  }
  if (whichbg == 16) {
    image(Background4, 0, 20, 1000, 980);
  }
  //if (whichbg == 17) {
  //  image(Background5, 0, 20, 1000, 980);
  //}
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
    //isSettingsOpen = true;
    dropopen = true;
  } else {
    c = 200;
  }
  if (!(mx > x - sx * 2 && mx < x + sx * 2 +100 && my > y - sy * 2 && my < y + sy + 300) && mousePressed) {
    dropopen = false;
  }
  fill(c);
  rect(x - sx * 2, y - sy * 2, x + sx * 2, y + sy * 2);
  fill(0);
  ellipse(x, y, sx, sy);
  fill(c);
  ellipse(x + sx / 2, y, sx/2, sy/2);
}
String AMPM = "AM";
public void bar() {
  float hours;
  String minutes;
  String seconds;
  textSize(12);
  if (hour() > 12) {
    hours = hour() - 12;
    AMPM = "PM";
  } else {
    hours = hour();
    AMPM = "AM";
  }
  if (second() < 10) {
    seconds = "0" + str(second());
  } else {
    seconds = str(second());
  }
  if (minute() < 10) {
    minutes = "0" + str(minute());
  } else {
    minutes = str(minute());
  }
  fill(200);
  rect(0, 0, width, 20);
  textAlign(CENTER, CENTER);
  fill(0);
  text(floor(hours) + ":" + minutes + ":" + seconds + " " + AMPM, 940, 10);
}

boolean chosen = false;

window settings = new window(200, 100, 0, isSettingsOpen);
window appstore = new window(200, 150, 1, isAppstoreOpen);
window flappy = new window(200, 200, 2, flappyOpen);
window notes = new window(200, 250, 3, notesOpen);
window webBrowser = new window(200, 300, 4, webOpen);

textFeild notesFeild = new textFeild(notes);
textFeild login = new textFeild(450, 600, 100, 20);
dropmenu appled = new dropmenu(0, 20, 0);

public void macOS() {
  if (startup_timer < time_to_load) {
    startup();
    startup_timer++;
  } else if (shuttingdown && shutdown_timer < time_to_shutdown) {
    startup();
    shutdown_timer++;
  } else if (!shuttingdown && !loggedout) {
    noStroke();
    backgrounds(type);
    bar();
    fill(0);
    appleBarLogo(20, 10, 10);
    if (hasFlappy) {
      if (isMouseInside(900, 30, 50, 50) && mousePressed) {
        flappyOpen = true;
      }
      stroke(0);
      fill(255, 255, 100);
      rect(900, 30, 50, 50);
      if (flappyOpen) {
        flappyBirdGame(flappy);
      }
    }

    if (isMouseInside(900, 170, 50, 50) && mousePressed) {
      notesOpen = true;
    }
    stroke(0);
    fill(89, 71, 0);
    rect(900, 170, 50, 10);
    fill(255, 255, 100);
    rect(900, 180, 50, 40);


    if (isMouseInside(900, 100, 50, 50) && mousePressed) {
      isSettingsOpen = true;
    }
    stroke(0);
    fill(159);
    rect(900, 100, 50, 50);
    fill(255);
    ellipse(925, 125, 40, 40);
    noStroke();

    if (isMouseInside(900, 240, 50, 50) && mousePressed) {
      webOpen = true;
    }
    stroke(0);
    fill(150);
    rect(900, 240, 50, 50);
    fill(100, 100, 255);
    ellipse(925, 265, 40, 40);
    noStroke();

    //if (isMouseInside(settings.x, settings.y, settings.w, settings.h) && mousePressed && isPriority != 0) {
    //  isPriority = 0;
    //}
    //if (isMouseInside(appstore.x, appstore.y, appstore.w, appstore.h) && mousePressed && isPriority != 1) {
    //  isPriority = 1;
    //}
    //if (isMouseInside(flappy.x, flappy.y, flappy.w, flappy.h) && mousePressed && isPriority != 2) {
    //  isPriority = 2;
    //}
    //if (isMouseInside(notes.x, notes.y, notes.w, notes.h) && mousePressed && isPriority != 3) {
    //  isPriority = 3;
    //}

    settings.mousemovement();
    appstore.mousemovement();
    flappy.mousemovement();
    notes.mousemovement();

    if (isPriority != 0 && isSettingsOpen) {
      settings.render(isSettingsOpen);
    } 
    if (isPriority != 1 && isAppstoreOpen) {
      appstore.render(isAppstoreOpen);
    } 
    if (isPriority != 2 && flappyOpen) {
      flappy.render(flappyOpen);
    } 
    if (isPriority != 3 && notesOpen) {
      notes.render(notesOpen);
      if (notesOpen) {
        notesFeild.render(notes);
      } else {
        notesFeild = new textFeild(notes);
      }
    }
    if (isPriority != 4 && webOpen) {
      webBrowser.render(webOpen);
    }

    if (isPriority == 0 && isSettingsOpen) {
      settings.render(isSettingsOpen);
    }  
    if (isPriority == 1 && isAppstoreOpen) {
      appstore.render(isAppstoreOpen);
    }  
    if (isPriority == 2 && flappyOpen) {
      flappy.render(flappyOpen);
    }  
    if (isPriority == 3 && notesOpen) {
      notes.render(notesOpen);
      if (notesOpen) {
        notesFeild.render(notes);
      } else {
        notesFeild = new textFeild(notes);
      }
    }  
    if (isPriority == 4 && webOpen) {
      webBrowser.render(webOpen);
    }


    settings.mousemovement();
    appstore.mousemovement();
    flappy.mousemovement();
    notes.mousemovement();
    webBrowser.mousemovement();

    if (notesOpen) {
      notesFeild.render(notes);
    } else {
      notesFeild = new textFeild(notes);
    }

    appled.render();
    macCursor();
    chosen = false;
  } else if (loggedout) {
    backgrounds(type);
    ellipse(500, 500, 100, 100);
    login.render();
    if ((key == ENTER || key == RETURN) && keyPressed) {
      loggedout = false;
    }
    macCursor();
  } else {
    exit();
  }
}
public void paint(window w){
  drawit(w);
}

public void drawit(window f){
  if(mousePressed && isMouseInside(f.x, f.y, f.w, f.y + 600)){
    ellipse(mouseX, mouseY, 10, 10);
  }
}
class textFeild {
  String result = ""; 
  boolean pressed = false, correct;
  window window;
  int textTimer = 0;
  float x, y, w, h;

  textFeild(window w) {
    window = w;
  }

  textFeild(float xb, float yb, float wb, float hb) {
    x = xb;
    y = yb;
    w = wb;
    h = hb;
    correct = false;
  }

  public void render(window w) {
    textAlign(CORNER, CORNER);
    fill(0); 
    text(result, w.x + 10, w.y + 30, w.w - 10, w.h - 10);
    if (keyPressed && ((!pressed) || (textTimer > 50 && keyCode != SHIFT)) && keyCode != SHIFT) {
      result = result + key;
      pressed = true;
    } else if (!keyPressed && pressed) {
      pressed = false;
      textTimer = 0;
    } else if (keyPressed && keyCode == SHIFT) {
      textTimer = 0;
    } else if (keyPressed && (keyCode == BACKSPACE || keyCode == DELETE)) {
      result = "";
    } else if (keyPressed) {
      textTimer++;
    }
  }

  public void render() {
    textAlign(CORNER, CORNER);
    fill(0); 
    text(result, x + 10, y, w - 10, h);
    if (keyPressed && ((!pressed) || (textTimer > 50 && keyCode != SHIFT)) && keyCode != SHIFT) {
      result = result + key;
      pressed = true;
    } else if (!keyPressed && pressed) {
      pressed = false;
      textTimer = 0;
    } else if (keyPressed && keyCode == SHIFT) {
      textTimer = 0;
    } else if (keyPressed && (keyCode == BACKSPACE || keyCode == DELETE)) {
      result = "";
    } else if (keyPressed) {
      textTimer++;
    }
  }

  public void render(String correctText) {
    textAlign(CORNER, CORNER);
    fill(0); 
    text(result, x + 10, y, w - 10, h);
    if (keyPressed && ((!pressed) || (textTimer > 50 && keyCode != SHIFT)) && keyCode != SHIFT) {
      if (trim(result) != correctText) {
        result = result + key;
      }
      pressed = true;
    } else if (!keyPressed && pressed) {
      pressed = false;
      textTimer = 0;
    } else if (keyPressed && keyCode == SHIFT) {
      textTimer = 0;
    } else if (keyPressed && (key == BACKSPACE || key == DELETE)) {
      result = "";
    } else if (keyPressed) {
      textTimer++;
    } else if (trim(result) == correctText) {
      correct = true;
    }
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
  float x, y, wt, w, ws, h;
  boolean ioset, ioapp, ioflap = false, io = false, search = false;
  window(float startingx, float startingy, float windowType, boolean isOpen) {
    x = startingx;
    y = startingy;
    wt = windowType;
    ioset = false;
    ioapp = false;
    boolean f_in_the_chat = isOpen;
    if (f_in_the_chat) {
    }
    ws = 0;
    w = 400;
    h = 600;
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
    if (pmx > x + 5 + 16 && pmx < x + w && pmy > y && pmy < y + 20 && mousePressed) {
      x = pmx - w / 2;
      y = pmy - 10;
    }
    if (isMouseInside(x + 5, y + 5, 16, 16) && mousePressed && wt == 0) {
      isSettingsOpen = false;
    }
    if (isMouseInside(x + 5, y + 5, 16, 16) && mousePressed && wt == 1) {
      isAppstoreOpen = false;
    }
    if (isMouseInside(x + 5, y + 5, 16, 16) && mousePressed && wt == 2) {
      flappyOpen = false;
    }
    if (isMouseInside(x + 5, y + 5, 16, 16) && mousePressed && wt == 3) {
      notesOpen = false;
    }
    if (isMouseInside(x + 5, y + 5, 16, 16) && mousePressed && wt == 4) {
      webOpen = false;
    }
    if (isMouseInside(x, y, w, h) && mousePressed && isPriority != wt) {
      isPriority = wt;
    }
  }


  public void render(boolean open) {
    io = open;
    if (io) {
      if (wt == 0) {
        h = 300;
        fill(230);
        rect(x, y, w, h);

        fill(200);
        rect(x, y, w, 20);
        fill(255, 50, 50);
        ellipse(x + 10, y + 10, 8, 8);

        if (ws == 0) {
          fill(0, 187, 255);
          rect(x + 10, y + 30, 20, 20);
          buttons(x + 10, y + 10, 1);
        } else if (ws == 1) {
          fill(255, 100, 100);
          rect(x + 10, y + 60, 20, 20);
          if (isMouseInside(x + 10, y + 60, 20, 20) && mousePressed) {
            type = 3;
          }
          fill(100, 255, 100);
          rect(x + 40, y + 60, 20, 20);
          if (isMouseInside(x + 40, y + 60, 20, 20) && mousePressed) {
            type = 2;
          }
          fill(100, 100, 255);
          rect(x + 70, y + 60, 20, 20);
          if (isMouseInside(x + 70, y + 60, 20, 20) && mousePressed) {
            type = 4;
          }
          fill(255, 100, 255);
          rect(x + 100, y + 60, 20, 20);
          if (isMouseInside(x + 100, y + 60, 20, 20) && mousePressed) {
            type = 5;
          }
          fill(100, 255, 255);
          rect(x + 130, y + 60, 20, 20);
          if (isMouseInside(x + 130, y + 60, 20, 20) && mousePressed) {
            type = 6;
          }
          fill(255, 255, 100);
          rect(x + 160, y + 60, 20, 20);
          if (isMouseInside(x + 160, y + 60, 20, 20) && mousePressed) {
            type = 7;
          }
          fill(255, 0, 0);
          rect(x + 190, y + 60, 20, 20);
          if (isMouseInside(x + 190, y + 60, 20, 20) && mousePressed) {
            type = 8;
          }
          fill(0, 255, 0);
          rect(x + 220, y + 60, 20, 20);
          if (isMouseInside(x + 220, y + 60, 20, 20) && mousePressed) {
            type = 9;
          }
          fill(0, 0, 255);
          rect(x + 250, y + 60, 20, 20);
          if (isMouseInside(x + 250, y + 60, 20, 20) && mousePressed) {
            type = 10;
          }
          fill(0);
          rect(x + 280, y + 60, 20, 20);
          if (isMouseInside(x + 280, y + 60, 20, 20) && mousePressed) {
            type = 11;
          }
          fill(255);
          rect(x + 310, y + 60, 20, 20);
          if (isMouseInside(x + 310, y + 60, 20, 20) && mousePressed) {
            type = 12;
          }
          fill(255);
          rect(x + 340, y + 60, 20, 20);
          if (isMouseInside(x + 340, y + 60, 20, 20) && mousePressed) {
            type = 13;
          }

          fill(255);
          rect(x + 370, y + 60, 20, 20);
          if (isMouseInside(x + 370, y + 60, 20, 20) && mousePressed) {
            type = 14;
          }
          fill(255);
          rect(x + 10, y + 90, 20, 20);
          if (isMouseInside(x + 10, y + 90, 20, 20) && mousePressed) {
            type = 15;
          }
          fill(255);
          rect(x + 30, y + 90, 20, 20);
          if (isMouseInside(x + 30, y + 90, 20, 20) && mousePressed) {
            type = 16;
          }
        }
      }
    } 
    if (io && wt == 1) {
      fill(230);
      h = 300;
      rect(x, y, w, h);
      fill(200);
      rect(x, y, w, 20);
      fill(255, 50, 50);
      ellipse(x + 10, y + 10, 8, 8);

      rect(x + 30, y + 20, 20, 20);
      if (isMouseInside(x + 30, y + 20, 20, 20) && wt == 1 && mousePressed) {
        hasFlappy = true;
      }
    }
    if (io && wt == 2) {
      w = 700;
      h = 600;
      fill(0, 187, 255);
      rect(x, y, w, h);
      fill(200);
      rect(x, y, w, 20);
      fill(255, 50, 50);
      ellipse(x + 10, y + 10, 8, 8);
    }
    if (io && wt == 3) {
      w = 300;
      h = 600;
      fill(230);
      rect(x, y, w, h);
      fill(200);
      rect(x, y, w, 20);
      fill(255, 50, 50);
      ellipse(x + 10, y + 10, 8, 8);
    }
    if (io && wt == 4) {
      w = 800;
      h = 600;
      fill(230);
      rect(x, y, w, h);
      fill(200); 
      rect(x, y, w, 20);
      fill(255, 50, 50); 
      ellipse(x + 10, y + 10, 8, 8);

      textAlign(CENTER, CENTER);
      textSize(50);
      if (!search) {
        fill(0);
        text("Me Search", x + w/2, y + h / 2 - 20);
      }
      if (isMouseInside(x+50, y+ h/2 + 30, 700, 50) && mousePressed && !search) {
        search = true;
      }
      if (!search) {
        fill(240);
        rect(x + 50, y + h / 2 + 30, 700, 50);
      }
      if (search) {
        fill(0);
        text("Error: 404 Page not found", x + 400, y + 300);
      }
      textSize(12);
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
