class SniperRifle extends Weapon {
  
  SniperRifle() {
  super(70,20); //threshold and bullet speed 
  }
  
}

class AutoPistol extends Weapon {
 AutoPistol() {
  super(10,5); 
 }
}

class ShotGun extends Weapon {
  
  ShotGun() {
  super(80,5); //threshold and bullet speed 
  }
  void shoot() {
    if (shotTimer>=threshold) {
     for(int i=0;i<35;i++) {
   PVector aimVector= new PVector(mouseX-myHero.location.x,mouseY-myHero.location.y); 
       aimVector.rotate(random(-PI,PI));
       aimVector.setMag(bulletSpeed);
     myObjects.add(new Bullet(7,255,aimVector)); //(aimVector,blue,10)
       shotTimer=0;
   }
     
    }
  }
}
