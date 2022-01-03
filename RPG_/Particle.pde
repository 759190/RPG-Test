class Particle extends GameObject {
 int tr; //transparency
 color pColor;
 Particle (float x, float y, int rx, int ry, int c) {
   hp=1;
   size=int(random(1,5));
   tr=200;
   location=new PVector(x,y);
    velocity= new PVector(0,1);
    pColor=c;
 
   
velocity.rotate(PI+random(-5,5)); 
   velocity.setMag(7); 
   roomx=rx;
roomy=ry;
   
 }
 
  void show() {
    rectMode(CENTER);
    stroke(pColor);
    noFill();
    circle(location.x,location.y,size);

  }
  void act() {
   location.add(velocity);
    tr=tr-10;
    if(tr<=0) hp=0;
    
  }
  
  
  
  
} //end
