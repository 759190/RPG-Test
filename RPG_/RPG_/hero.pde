
class Hero extends GameObject {

  Weapon myWeapon;
  

  Hero() {
    super();
    hp=100;
    //speed=5;
    roomx=3;
    roomy=1;
    whichCat=3;
    xp=0;
    coinValue=3;
    damage=0;
    betterxp=0;
    purchasedWhiteCat=0;

    //tint(255,0,0);
    //tint(255,255,255); reset color
    if (whichCat==1) {
      currentAction = orangeStill;
    }
    if (whichCat==2) {
      currentAction = whiteStill;
            purchasedWhiteCat=1;

    }
    if (whichCat==3) {
      currentAction = blackStill;
    }

    myWeapon=new Weapon();
   
    size=80;
  }

  void show() {
    fill(0);
    textSize(30);
    textSize(20);
    text(hp, location.x, location.y-50); // hp counter
    fill(0);
    textSize(30);
    textSize(20);

    strokeWeight(4);
    currentAction.show(location.x-40, location.y-45, size, size);

    //orange cat
    if (whichCat==1) {
      speed=4;
      currentAction = orangeStill;
      hpMax=150;
    }
    //white cat
    if (whichCat==2) {
      speed=5;
      currentAction = whiteStill;  
      hpMax=200;
      purchasedWhiteCat=1;
    }
    //black cat
    if (whichCat==3) {
      speed=3;
      currentAction = blackStill; 
      hpMax=100;
    }
    if (myHero.hp>=hpMax) myHero.hp=hpMax; //hpMax (starts at 100)
  }

  void act() {
    super.act();


    int j=0;
    while (j<myObjects.size()) {
      GameObject obj =myObjects.get(j);
      if (obj instanceof DroppedItem && isCollidingWith(obj)) {

        DroppedItem item=(DroppedItem)obj;
        if (item.type==GUN) {
          myWeapon=item.w;
          item.hp=0;
        }
      }
      j++;
    } 






    myWeapon.update();
    if (spacekey) myWeapon.shoot();    
    //---------------------
    //moving the hero
    if (wkey) {
      velocity.y=-speed;
      if (whichCat==1) {
        currentAction = orangeUp;
      }
      if (whichCat==2) {
        currentAction = whiteUp;
              purchasedWhiteCat=1;

      }
      if (whichCat==3) {
        currentAction = blackUp;
      }
    }
    if (skey) {
      velocity.y=speed;
      if (whichCat==1) {
        currentAction = orangeDown;
      }
      if (whichCat==2) {
        currentAction = whiteDown;
              purchasedWhiteCat=1;

      }
      if (whichCat==3) {
        currentAction = blackDown;
      }
    }

    if (akey) {
      velocity.x=-speed;

      if (whichCat==1) {
        currentAction = orangeLeft;
      }
      if (whichCat==2) {
        currentAction = whiteLeft;
              purchasedWhiteCat=1;

      }
      if (whichCat==3) {
        currentAction = blackLeft;
      }
    }
    if (dkey) {
      velocity.x=speed;

      if (whichCat==1) {
        currentAction = orangeRight;
      }
      if (whichCat==2) {
        currentAction = whiteRight;
              purchasedWhiteCat=1;

      }
      if (whichCat==3) {
        currentAction = blackRight;
      }
    }
    if (velocity.mag()>speed) 
      velocity.setMag(speed);


    if (!wkey&&!skey) velocity.y=velocity.y*0.75;
    if (!akey&&!dkey) velocity.x=velocity.x*0.75;

    //check exits
    //north
    if (northRoom!=#FFFFFF && location.y==100&&location.x>=width/2-50 &&location.x<=width/2+50) { 
      roomy--; 
      location=new PVector(width/2, height-105);
      cleanUp();
    } 
    if (southRoom!=#FFFFFF && location.y==height-100&&location.x>=width/2-50 &&location.x<=width/2+50) { 
      roomy++;
      location=new PVector(width/2, 100);
      cleanUp();
    } 
    if (eastRoom!=#FFFFFF && location.x==width-120&&location.y>=height/2-50 &&location.y<=height/2+50) { 
      roomx++; 
      location=new PVector(125, height/2);
      cleanUp();
    } 
    if (westRoom!=#FFFFFF && location.x==120&&location.y>=height/2-50 &&location.y<=height/2+50) { 
      roomx--;
      location=new PVector(width-120, height/2);
      cleanUp();
    }
  }

  void cleanUp() {
    int i=0;
    while (i<myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet || obj instanceof Message) {
        if (!inRoomWith(obj)) {
          myObjects.remove(i);
          i--;
        }
      }
              i++;

    }
  }
}
