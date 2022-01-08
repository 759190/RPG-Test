class Message extends GameObject{
          //myObjects.add(new Message(location, "x"+xp);
   
  int t;
  String mtext;
  
  Message (float x, float y, int rx, int ry,String tx) {
hp=1;
location=new PVector(x,y);
velocity=new PVector(0,-1);
size=30;
roomx=rx;
roomy=ry;
 t=300;
 mtext=tx;
  }
  
  void show() {
    fill(255);
    text(mtext,location.x,location.y);
     
  }
  void act() {
location.add(velocity);
   t=t-8;
    if(t<=0) hp=0;
 
    
  }
} //end
