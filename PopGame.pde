
Balloon[] balloons;
int score = 0;
int elapsedTime = 0;
int gameTime = 30;

void setup() {
  
  size(500, 500);
  smooth();
  
  
  balloons = new Balloon[10];
  for (int i=0; i<balloons.length; i++) {
    balloons[i] = new Balloon();
  }
}

void draw() {
  
  elapsedTime = int(millis()/1000);
  
  
  if (elapsedTime > gameTime) return;
  
  
  inflateBalloons();
  
  
  background(255);

  
  drawBalloons();
  
  
  drawHeader();

}


void mousePressed() {
  
  if (elapsedTime > 30) return;
  
  
  for (int i=0; i<balloons.length; i++) {
    score = score + balloons[i].pop(mouseX, mouseY);
  }
}


void inflateBalloons() {
  for (int i=0; i<balloons.length; i++) {
    balloons[i].inflate();
  }
}


void drawBalloons() {
  for (int i=0; i<balloons.length; i++) {
    balloons[i].draw();
  }
}


void drawHeader(){
  fill(0);
  textSize(24);
  textAlign(CENTER, CENTER);
  String msg = " " + score + " balloons in " + elapsedTime + " seconds";
  text(msg, 0.0, 0.0, width, 100.0);
}


class Balloon {

  float x;
  float y;
  float diam;
  color clr;
  

  Balloon() {
    reset();
  }
  

  void draw() {
    ellipseMode(CENTER);
    fill(clr);
    stroke(0);
    ellipse(x, y, diam, diam);
  }
  

  void inflate() {
    diam = diam + 0.5;
  }
  

  void reset() {
    x = random(0, width);
    y = random(0, height);
    diam = 0.0;
    clr = color(random(200,255),random(200,255),random(200,255));
  }
  

  int pop(float px, float py) {
    

    if ( dist(x, y, px, py) < 0.5*diam ) {
      reset();
      return 1;
    } else {
      return 0;
    }
  }
}
