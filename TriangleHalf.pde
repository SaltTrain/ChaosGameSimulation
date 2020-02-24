// inits required objects
DotManager app;
Title title;
FPS fps;
Trailing trail;

ArrayList<Character> fpsInput;
char lastValue;

// boundry starting points
int aX;
int aY;
int bX;
int bY;
int cX;
int cY;
// original game starting point
int originX;
int originY;

// controls simulation speed with + and - key
//
//
int delayAmount = 10;

// controllable variables
private int size = 2;
private boolean showFPS = true;
private int length = 10;


void setup(){
  
  // sets up windows size
  size(1000,1000,P2D);
  //fullScreen(P3D);
  aX = width/16;
  aY = height;
  bX = width - (width/4);
  bY = 0;
  cX = width - (width/16);
  cY = height;
  originX = width/2;
  originY = height/2;
  fpsInput = new ArrayList<Character>();
  background(#896A39);
  // creates app
  app = new DotManager(aX,aY, bX,bY, cX,cY, originX,originY,size);
  frameRate(900);
  // fps handling
  fps = new FPS(showFPS);
  // sets title
  title = new Title("Sierpinski Gasket Triangle");
  title.display();
  //trail = new Trailing(length);
  
}



// key checking
void keyPressed(){
  // controls simulation speed with + and - key //<>// //<>//
  if(key=='+'){delayAmount+=10;}
  if(key=='-'){delayAmount-=10;}
  
  // control trail length
  if(key==']'){trail.addLength();}
  if(key=='['){trail.subtractLength();}
}





// renders screen
void draw(){
  //background(#896A39);
  displayGeneration(app.getGeneration());
  title.display();
  app.run();
  fps.display();
  //trail.addDotPosition(app.getDotPosition());
  //trail.trailOn();
  delay(delayAmount());
}










// return positive delay amount
int delayAmount(){return (delayAmount<=0)?0:delayAmount;}



void displayGeneration(int g){
  // draws background for refresh
  fill(#896A39);
  noStroke();
  rect(width/16,height/5,250,100);
  // display gen
  textSize(24);
  fill(0);
  stroke(0);
  text("Generations: "+String.valueOf(g),width/16,height/4);
}

class FPS{
  // variable
  private boolean showFPS = true;
  // constructor
  FPS(boolean showFPS){
    this.showFPS = showFPS;
  }
  // handles display output
  void display() {
    // displays background refresh
    fill(#896A39);
    noStroke();
    rect(width/16,height/3.5,125,75);
    
    // displays fps
    textSize(26);
    fill(0);
    text(frameRate,width/16,height/3);
    
  }
  // sets visability
  void setFPS(boolean showFPS){this.showFPS=showFPS;}
  
}

class Title{
  // instance variables
  private String title;
  
  Title(String title){
    this.title = title;
  }
  
  void display(){
    // displays fps
    textSize(28);
    fill(0);
    text(this.title, width/24,height/8);
  }
}
