class GameObject {
  int roomx,roomy;
  int size;
  PVector location;
  PVector velocity;
  int hpMax;
  int hp,xp;
  int money;
  int coinValue;
 int Itimer;
  float speed;
  int damage;
  int betterxp;
  int purchasedWhiteCat;
  
  GameObject() {
    location=new PVector(width/2,height/2);
    velocity=new PVector(0,0);
    hp=1;
    money=0;
    hpMax=100;
    Itimer=0;
    damage=0;
    
  }
  
  boolean inRoomWith(GameObject myObj) {
    if (roomx==myObj.roomx && roomy== myObj.roomy)
    return true;
    else
    return false;
  }
  
  
  boolean isCollidingWith(GameObject myObj) {
    float d= dist(myObj.location.x,myObj.location.y,location.x,location.y);
    if(inRoomWith(myObj) && d<size/2+myObj.size/2 && hp>0) 
    return true;
    else
    return false;
  }
  
  void show() {
  }
  void act() {
 
    location.add(velocity);
    
     //if object hits wall
    if(location.y>height-100)         location.y=height-100;
    if(location.y<0+100)             location.y=0+100;
    if(location.x>width-120)         location.x=width-120;
    if(location.x<0+120)             location.x=0+120;

  }
  
}//end
