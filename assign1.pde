SlotMachine machine;
boolean rolling = false;
// button information
boolean button = false;
int x = 640/2;
int y = 440;
int w = 150;
int h = 50;

// declare variables
// --------------------------------------------
// put your code inside here
int totalScore = 500;
// --------------------------------------------

void setup() {
  size(640,480);
  textFont(createFont("fonts/Square_One.ttf", 20));
  machine = new SlotMachine();
}

void draw() {
  background(245,229,124);
  fill(64,162,171);
  rect(320,248,396,154,25);
  fill(253,253,253);
  rect(220,247,97,114,2);
  rect(320,247,97,114,2);
  rect(420,247,97,114,2);
  // draw button
  fill(64,162,171);
  noStroke();
  rectMode(CENTER);
  rect(x,y,w,h,105);
  // show title
  fill(64,64,63);
  textAlign(CENTER, CENTER);
  textSize(32);
  text("Slot Machine",x,49);
  textSize(20);
  text("Score"+" "+":"+" "+totalScore,x, 89);
  
  // event handler
  if (button) {
    if (!rolling){
      rolling = true;
      // start rolling
      // -------------------------------------------------
      // put your code inside here
      totalScore -= 50;
      // -------------------------------------------------
    }
    machine.roll();
    textSize(19);
    text("Stop",x,y);
  
  } else {
    if (rolling){
      rolling = false;
      // stop rolling
      // -------------------------------------------------
      // put your code inside here
    int result = machine.probability( 1944.0/2150.0 );
    //by using 0.9, the probabilaty of 777 will be larger than 0.1. using 1944/2150 is closer to a more accurate result
      
   //fruit number in slot
   // mahcine.setSlotFruit(int slotPosition, int fruitId);
    int randA = int(random(6));
    int randB = int(random(6));
    int randC = int(random(6)); 
    
    machine.setSlotFruit(0, (randA)*result);
    machine.setSlotFruit(1, (randB)*result);
    machine.setSlotFruit(2, (randC)*result);

  //get slot score
  //  mahcine.getSlotScore(int slotPosition);
  
    int a = machine.getSlotScore(0); 
    int b = machine.getSlotScore(1); 
    int c = machine.getSlotScore(2); 
    int d = machine.getSlotScore(3);
    int e = machine.getSlotScore(4);
    int f = machine.getSlotScore(5);
    
    //get fruit count
    int m = machine.getFruitCount(0); 
    int n = machine.getFruitCount(1); 
    int o = machine.getFruitCount(2);
    int p = machine.getFruitCount(3);
    int q = machine.getFruitCount(4);
    int r = machine.getFruitCount(5);
   
   http://www.ebaomonthly.com/bible/index.php
    //total score change
    totalScore =  totalScore + a*m*m + b*n*n + c*o*o + d*p*p + e*q*q +f*r*r;
      // -------------------------------------------------
    }
    machine.stop();
    fill(253,253,253);
    textSize(19);
    text("Roll",x,y);
  }

}

// When the mouse is pressed, the state of the button is toggled.   
void mousePressed() {
  if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
    button = !button;
  }  
}






