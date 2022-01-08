class EnemyBullet extends GameObject {
  int timer;
 
  EnemyBullet(float x,float y, float vx, float vy, int rx, int ry) {
    timer=35;
    hp=1;
    location=new PVector(x,y);
    velocity= new PVector(vx,vy);
    velocity.setMag(10); // set magnatude
    size=10;
    roomx=rx;
    roomy=ry;
    Itimer=180;
     

  }
 void show() {
   stroke(255);
   fill(255);
   tint(0,200);
    image(ectoplasm,location.x-12, location.y-10,size+15,size+15);
tint(255);
   
    Itimer=Itimer+1;
 }
 void act() {
   super.act();
   
   
   //bullet reload time
   timer--;
   if(timer<=0) {
     hp=0;  
   }
 
   //collision code  
    if (Itimer>180) {
   int t=0;
    while(t<myObjects.size()) {
     GameObject obj =myObjects.get(t);
  if(obj instanceof Hero && isCollidingWith(obj)) {
   obj.hp=obj.hp-5;
     Itimer=0;
   }
    t++;
    } 
  
 }
}
}//end
