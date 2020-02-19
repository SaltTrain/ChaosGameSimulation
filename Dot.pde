
class Dot {

  // instance variable
  private PVector position;
  
  // constructor
  public Dot(float x, float y) {
  this.position = new PVector(x,y);
  
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
    fill(255);
    stroke(255);
    circle(0,0,2);
    popMatrix();
    
    
  }


}
