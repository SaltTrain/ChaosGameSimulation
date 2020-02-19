
DotManager app;
float padding = 20;
int widthPadding;


void setup(){
  // sets up windows size
  //size(600,600);
  fullScreen(P3D);
  widthPadding = width/3;
  background(0);
  // creates app
  app = new DotManager(widthPadding,height-padding,width/2,padding,widthPadding+widthPadding,height-padding,312,525);
  frameRate(240);
  
}


void draw(){

  app.run();
  showFPS(false);
}

void showFPS(boolean show){
  if(show){
    textSize(32);
    fill(255);
    text(frameRate,40,40);
  }
}
