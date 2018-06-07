/**
Bryn Mawr College, Department of Computer Science <br>
An in-class exercise for topdown design
The full game, finished version
*/

// Declare Pop Game variables
Balloon[] balloons;
int score = 0;
int elapsedTime = 0;
int gameTime = 30;

void setup() {
  // Setup sketch
  size(500, 500);
  smooth();
  
  // Create and initialize all balloons
  balloons = new Balloon[10];
  for (int i=0; i<balloons.length; i++) {
    balloons[i] = new Balloon();
  }
}

void draw() {
  // Update elapsedTime
  elapsedTime = int(millis()/1000);
  
  // Check for game over
  if (elapsedTime > gameTime) return;
  
  // Inflate all balloons
  inflateBalloons();
  
  // Clear background
  background(255);

  // Draw all Balloons
  drawBalloons();
  
  // Draw score and time elapsed
  drawHeader();

}

// Pop Balloons
void mousePressed() {
  // Exit if game is over
  if (elapsedTime > 30) return;
  
  // Pop balloons and increment score
  for (int i=0; i<balloons.length; i++) {
    score = score + balloons[i].pop(mouseX, mouseY);
  }
}

// Inflate Balloons
void inflateBalloons() {
  for (int i=0; i<balloons.length; i++) {
    balloons[i].inflate();
  }
}

// Draw Balloons
void drawBalloons() {
  for (int i=0; i<balloons.length; i++) {
    balloons[i].draw();
  }
}

// Draw score and elapsed time
void drawHeader(){
  fill(0);
  textSize(24);
  textAlign(CENTER, CENTER);
  String msg = "Popped " + score + " balloons in " + elapsedTime + " seconds";
  text(msg, 0.0, 0.0, width, 100.0);
}

// Define Balloon class
class Balloon {
  // Track of Ballon location, diameter and color
  float x;
  float y;
  float diam;
  color clr;
  
  // Initialize all Balloon fields
  Balloon() {
    reset();
  }
  
  // Draw the Mole
  void draw() {
    ellipseMode(CENTER);
    fill(clr);
    stroke(0);
    ellipse(x, y, diam, diam);
  }
  
  // Inflate the Balloon
  void inflate() {
    diam = diam + 0.5;
  }
  
  // Reset Balloon fields to random values
  void reset() {
    x = random(0, width);
    y = random(0, height);
    diam = 0.0;
    clr = color(random(200,255),random(200,255),random(200,255));
  }
  
  // Try to pop the Balloon
  int pop(float px, float py) {
    
    // If player has popped the balloon, score 1 and reset to a new balloon.
    if ( dist(x, y, px, py) < 0.5*diam ) {
      reset();
      return 1;
    } else {
      return 0;
    }
  }
}
