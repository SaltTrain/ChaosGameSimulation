 
 
 
 
 class Trailing{
 
   // instance variable
   private ArrayList<PVector> list = new ArrayList<PVector>();
   private int length;
   private int iteration = 0; //<>//
   private boolean updown = true;
   private int r = 0;
   private int g = 0;
   private int b = 0; 
   
   // constructor
   public Trailing(int length){
     this.length = length;
   }
   
   // updates iterator
   private void updateIterator(){this.iteration++;}
   
   // add length
   public void addLength(){this.length++;}
   // subtract length
   public void subtractLength(){this.length--;print(this.length);}
 
   // add new dots PVector to list for updated trails
   public void addDotPosition(PVector pos){this.list.add(pos);}
     
   // dynamically adjust for loop expression to accomodate trail length
   private int dynamicLength(){
     if(this.iteration >= this.length){return this.length;}
     return this.list.size();
   }
   
   // adjust color for graident effect
   private void graident(){
    // adjust color
    if(this.updown){
      if(this.r==255 && this.g==255){
        this.b+=15;
      }else if(this.r==255){
        this.g+=15;
      }else{
        this.r+=15;
      }
    }else{
      if(this.r==0 && this.g==0){
        this.b-=15;
      }else if(this.r==0){
        this.g-=15;
      }else{
        this.r-=15;
      }
    }
    
     
     
     
   }
 
   // generate trail from the last nth position
   public void trailOn(){
     for(int i=1; i<this.dynamicLength(); i++){ //<>//
       this.updown = (this.r==255&&this.g==255&&this.b==255)?false:(this.r==0&&this.g==0&&this.b==0)?true:this.updown;
       stroke(this.r,this.g,this.b); //<>//
       strokeWeight(10);
       line((int)this.list.get(this.list.size()-i).x, (int)this.list.get(this.list.size()-i).y, (int)this.list.get(this.list.size()-(i+1)).x, (int)this.list.get(this.list.size()-(i+1)).y); //<>//
       this.graident();
     }
     this.updateIterator();
   }
   
   

 
 
 
 }
