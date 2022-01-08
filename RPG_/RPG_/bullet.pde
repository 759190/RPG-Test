class Bullet extends GameObject {
 
  int timer;
 color Bcolour; //bullet color 
    
  Bullet(int s,color bc, PVector av) { //size, bullet colour
   timer=100;
    location=myHero.location.copy(); //   location=myHero.location.copy();
  size=s;
  Bcolour=bc;
  velocity = av;
  roomx=myHero.roomx;
  roomy=myHero.roomy;
  
 }
  
  
 void show() {
   noStroke();
   fill(Bcolour);
   ellipse(location.x,location.y,size,size);
 }
 void act() {
   //super.act();
    location.add(velocity);
   
   //bullet reload time
   timer=timer-1;
   if(timer<=0) {
     hp=0;  
   }
    if(location.y>height-95)          hp=0;
    if(location.y<0+95)               hp=0;
    if(location.x>width-115)          hp=0;
    if(location.x<0+115)              hp=0;

 }
  
  
}//end
