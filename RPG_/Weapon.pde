class Weapon extends GameObject {
  int shotTimer; //how much you have charged up
  int threshold; //how many frames you need to charge your bullet
  int bulletSpeed; 
  
  
  Weapon() {
    shotTimer=0;
    threshold=30; 
    bulletSpeed=5;
  }
  Weapon(int thr, int bs) {
  shotTimer=0;
  threshold=thr;
  bulletSpeed=bs;
  }
  void update() {
   shotTimer++;  
  }
  void shoot() {
   if (shotTimer>=threshold) {
PVector aimVector= new PVector(mouseX-myHero.location.x,mouseY-myHero.location.y); 
       aimVector.setMag(bulletSpeed);
     myObjects.add(new Bullet(10,indigo,aimVector)); //(aimVector,blue,10)
       shotTimer=0;

      
   }
   
  }
} //end
