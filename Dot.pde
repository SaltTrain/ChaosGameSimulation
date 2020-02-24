
class Dot {

  // instance variable
  private PVector position;
  private int size;
  
  // constructor
  public Dot(float x, float y, int size) {
  this.position = new PVector(x,y);
  this.size = size;
  
  }
  
  public PVector getPosition(){
    return this.position;
  }
  
  // updates Dots state
  public void update(){
    this.render();
  }
  
  // renders graphics
  private void render(){
    
    pushMatrix();
    translate(this.position.x,this.position.y);
    fill(0);
    stroke(0);
    circle(0,0,size);
    popMatrix();
    
    
  }


}
