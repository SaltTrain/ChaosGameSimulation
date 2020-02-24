
class DotManager {
  
  // dot size
  private int dotSize;
  private int generation;

  // instance variable
  // holds all Dots objects
  private ArrayList<Dot> dots = new ArrayList<Dot>();
  private Dot[] boundaries = new Dot[6];
  
  public DotManager(float x0, float y0, float x1, float y1, float x2, float y2, float dX, float dY, int dotSize) {
    // sets size of dot
    this.dotSize = dotSize;
    // sets left, top, right points on the triangle boundry
    this.boundaries[0] = new Dot(x0,y0,size);
    this.boundaries[1] = new Dot(x0,y0,size);
    this.boundaries[2] = new Dot(x1,y1,size);
    this.boundaries[3] = new Dot(x1,y1,size);
    this.boundaries[4] = new Dot(x2,y2,size);
    this.boundaries[5] = new Dot(x2,y2,size);
    
    // adds initial dots inside the boundry
    // temp soultion
    // look at finding a random position inside the triangle boundries
    this.addDot(new Dot(dX,dY,size));

  }
  
  // return dot position, based on index parameter
  public PVector getDotPosition(){
    return this.dots.get(this.dots.size()-1).getPosition();
  }
  
  // return generation
  public int getGeneration(){return this.generation;}
  
  // add dot
  private void addDot(Dot d){
    this.dots.add(d);
    this.generation++;
  }
  
  public void run(){
    // logic
    this.processing();
    
    // processing rendering
    this.renderUpdate();
  }
  
  private void processing(){
    
    // randomly chooses a point
    int rand = (int)random(6);
    PVector nextPos = this.getNextPos(rand);
    // create new dot object and set new pos
    Dot d = new Dot(nextPos.x, nextPos.y, dotSize);
    // end adds new updated dot for processing
    this.addDot(d);
  }
  
  // loops
  // update Dots
  private void renderUpdate(){
    for(Dot _dot: this.boundaries){
      _dot.update();
    }
    this.dots.get(this.dots.size()-1).update();
  }
  
  // gets next position based on which point is chosen
  private PVector getNextPos(int rand){
    // modified variables, for adding with first dot
    PVector XY = this.boundaries[rand].getPosition();
    PVector xyN = this.dots.get(this.dots.size()-1).getPosition();
    float x = 0;
    float y = 0;
    switch(rand){
    case 0:
    case 1:
      // A
      // x = xN - mX, y = yN - mY
      x = xyN.x + ((XY.x - xyN.x)/2);
      y = xyN.y + ((XY.y - xyN.y)/2);
      break;
    case 2:
    case 3:
      // B
      if(XY.x>xyN.x){
       x = xyN.x + ((XY.x-xyN.x)/2);
      }else {
       x = xyN.x - ((xyN.x-XY.x)/2);

      }
      y = xyN.y - ((xyN.y - XY.y)/2);
      break;
    case 4:
    case 5:
      // C
      // x = xN + mX, y = yN + mY
      x = xyN.x + ((XY.x - xyN.x)/2);
      y = xyN.y + ((XY.y - xyN.y)/2);
      break;
    default:
      break;
    }
    // next pos based on random dice role
    PVector nextPos = new PVector(x,y);
    return nextPos;
  }
}
