class DroppedItem extends GameObject {
  
  int type, randomType, randomSpawn;

  Weapon w; 
  color c;
  
  
  DroppedItem (float x, float y, int rx, int ry) {


   randomType=int (random(0,3));
    if (randomType==0) {
      type=GUN;
      c=black;
     randomSpawn=int (random(0,3)); 
     if (randomSpawn==0) {
       w=new ShotGun();
     }
     if (randomSpawn==1) {
     w=new SniperRifle(); 
     }
     if (randomSpawn==2) {
     w=new AutoPistol();
     }
    }
    if (randomType==1) {
      type=HEALTH;
      c=blue;
    }
    if (randomType==2) {
     type=COIN; 
     c=yellow;
    }
hp=1;
location=new PVector(x,y);
velocity=new PVector(0,0);
size=30;
roomx=rx;
roomy=ry;
  }
  
  void show() {
    stroke(black);
    fill(c);
    circle(location.x,location.y,size);
    textSize(20);
    if (type==GUN) {
     if (randomSpawn==0) {
       fill(255);
      text("SG",location.x,location.y); 
     }
     if (randomSpawn==1) {
      fill(255);
     text("SR",location.x,location.y); 
     }
     if (randomSpawn==2) {
      fill(255);
     text("AP",location.x,location.y); 
     }
    }
     if (type==COIN) {
     fill(black);
      text("$",location.x,location.y); 
     }
     if(type==HEALTH) {
     fill(255);
      text("HP",location.x,location.y);  
     }
     
  }
  void act() {

   int j=0;
    while(j<myObjects.size()) {
     GameObject obj =myObjects.get(j);
    if(obj instanceof Hero && isCollidingWith(obj)) {
 hp=0;
   if (randomType==1) {
   myHero.hp= myHero.hp+10;

   }else if (randomType==2) {
   myHero.money=myHero.money+myHero.coinValue;

   }
  }
    j++;
    } 
 
    
  }
} //end
