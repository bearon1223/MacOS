float startup_timer = 0, shutdown_timer = 0; 
float time_to_load = random(500, 1020), time_to_shutdown = random(500, 1020);
float startx = 0;
float starty = 0;
//float time_to_load = 1;
boolean dropopen = false, isSettingsOpen = false, shuttingdown = false, isAppstoreOpen = false, hasFlappy = true, flappyOpen = false, notesOpen = false, isPaintOpen = false;
float isPriority = 0;

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
void bar() {
  float hours;
  String minutes;
  String seconds;
  if (hour() > 12) {
    hours = hour() - 12;
    AMPM = "PM";
  } else {
    hours = hour();
    AMPM = "PM";
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
textFeild notesFeild = new textFeild(notes);
textFeild login = new textFeild(450, 600, 100, 20);
dropmenu appled = new dropmenu(0, 20, 0);

void macOS() {
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
    appled.render();
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
    settings.mousemovement();
    appstore.mousemovement();
    flappy.mousemovement();
    notes.mousemovement();

    if(isMouseInside(settings.x, settings.y, settings.w, settings.h) && mousePressed && isPriority != 1){
      isPriority = 1;
    }

    if (isPriority == 1) {
      settings.render(isSettingsOpen);
    } else if (isPriority == 2) {
      appstore.render(isAppstoreOpen);
    } else if (isPriority == 3) {
      flappy.render(flappyOpen);
    } else if (isPriority == 4) {
      notes.render(notesOpen);
    }
    if (notesOpen) {
      notesFeild.render(notes);
    } else {
      notesFeild = new textFeild(notes);
    }
    macCursor();
    chosen = false;
  } else if (loggedout) {
    backgrounds(type);
    ellipse(500, 500, 100, 100);
    //if (isMouseInside(450, 450, 100, 100) && mousePressed) {
    //  chosen = true;
    //}
    login.render("password");
    if ((key == ENTER || key == RETURN) && keyPressed && login.correct) {
      loggedout = false;
    }
    macCursor();
  } else {
    exit();
  }
}
