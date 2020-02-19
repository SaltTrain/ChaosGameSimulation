
class DotManager {
  
  

  // instance variable
  // holds all Dots objects
  private ArrayList<Dot> dots = new ArrayList<Dot>();
  private Dot[] boundaries = new Dot[6];
  
  public DotManager(float x0, float y0, float x1, float y1, float x2, float y2, float dX, float dY) {
    // sets left, top, right points on the triangle boundry
    // temp solution
    // find a more consitant way through weidth and height of screen, scaleable
    this.boundaries[0] = new Dot(x0,y0);
    this.boundaries[1] = new Dot(x0,y0);
    this.boundaries[2] = new Dot(x1,y1);
    this.boundaries[3] = new Dot(x1,y1);
    this.boundaries[4] = new Dot(x2,y2);
    this.boundaries[5] = new Dot(x2,y2);
    
    // adds initial dots inside the boundry
    // temp soultion
    // look at finding a random position inside the triangle boundries
    this.addDot(new Dot(dX,dY));

  }
  
  // add dot
  private void addDot(Dot d){
    this.dots.add(d);
  }
  
  public void run(){
    // logic
    this.processing();
    
    // processing rendering
    this.renderUpdate(this.boundaries, this.dots);
  }
  
  private void processing(){
    
    // randomly chooses a point
    int rand = (int)random(6);
    PVector nextPos = this.getNextPos(rand);
    // create new dot object and set new pos
    Dot d = new Dot(nextPos.x, nextPos.y);
    // end adds new updated dot for processing
    this.addDot(d);
  }
  
  // loops
  // update Dots
  private void renderUpdate(Dot[] boundaries, ArrayList<Dot> dots){
    for(Dot _dot: boundaries){
      _dot.update();
    }
    this.dots.get(this.dots.size()-1).update(); //<>//
    //for(Dot _dot: dots){
    //  _dot.update();
    //}
  }
  
  
  private PVector getNextPos(int rand){
    // modified variables, for adding with first dot
    PVector XY = this.boundaries[rand].getPosition();
    PVector xyN = this.dots.get(this.dots.size()-1).getPosition();
    float x = 0;
    float y = 0;
    println(rand); //<>//
    switch(rand){ //<>//
    case 0:
    case 1:
      // A
      // x = xN - mX, y = yN - mY
      x = xyN.x + ((XY.x - xyN.x)/2); //<>//
      y = xyN.y + ((XY.y - xyN.y)/2); //<>//
      break;
    case 2:
    case 3:
      // B //<>// //<>//
      if(XY.x>xyN.x){
       x = xyN.x + ((XY.x-xyN.x)/2);
      }else {
       x = xyN.x - ((xyN.x-XY.x)/2);

      }
      y = xyN.y - ((xyN.y - XY.y)/2); //<>//
      break; //<>//
    case 4:
    case 5:
      // C
      // x = xN + mX, y = yN + mY
      x = xyN.x + ((XY.x - xyN.x)/2); //<>// //<>//
      y = xyN.y + ((XY.y - xyN.y)/2); //<>// //<>//
      break;
    default:
      break;
    }
    // next pos based on random dice role
    PVector nextPos = new PVector(x,y);
    return nextPos;
  }
}
