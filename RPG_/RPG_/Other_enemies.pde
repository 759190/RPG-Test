float vx, vy;

class Bouncer extends Enemy {
  //instance variables
  float d, vx, vy;



  //constructor
  Bouncer(int rx, int ry) {
    super(80, 30, rx, ry);  //hp, size, roomx, roomy
    x=width/2;
    y=height/2;
    d=30;
    vx = random(0, 5);
    vy = random(0, 5);
    roomx=rx;
    roomy=ry;
    xp=5 +myHero.betterxp;
    hp=1;
    Itimer=180;
    location.x=width/2;
    location.y=height/2;
  }


  void show() {
    stroke(0);
    strokeWeight(6);
    //fill(0);
    //circle(location.x,location.y,d);
    Itimer++;
    tint(255, 200);
    image(ectoplasm, location.x-25, location.y-20, 60, 60);
    tint(255);
  }
  void act() {
    super.act();

    //collision code  
    if (Itimer>180) {
      int l=0;
      while (l<myObjects.size()) {
        GameObject obj =myObjects.get(l);
        if (obj instanceof Hero && isCollidingWith(obj)) {
          obj.hp=obj.hp-5;
          Itimer=0;
        }
        l++;
      }
    } 

    // bouncing
    location.x=location.x+vx;
    location.y=location.y+vy;
    if (location.x>680-d/2 || location.x<120+d/2) {
      vx=-vx;
    }
    if (location.y>500-d/2 || location.y<120+d/2) {
      vy=-vy;
    }
  }
}



//------------------------------------------------------------------------

class Tower extends Enemy {
  int tTimer;



  Tower(int rx, int ry) {
    super(150, 60, rx, ry);  //hp, size, roomx, roomy
    tTimer=0;
    xp=10 +myHero.betterxp;
    Itimer=180;
    location.x=width/2;
    location.y=height/2;
  }
  void show() {
    strokeWeight(4);
    //fill(green);
    //circle(location.x,location.y,size);
    tint(150, 180);
    ghostLeft.show(location.x-75, location.y-55, 150, 150);
    tint(255);

    tTimer=tTimer+1;
    Itimer++;
    vx=myHero.location.x-location.x; 
    vy=myHero.location.y-location.y;
  }

  void act() {
    super.act();
    while (tTimer==100) {
      myObjects.add(new EnemyBullet(location.x, location.y, vx, vy, roomx, roomy));//x,y, vx,vy,rx,ry
      tTimer=0;
    }
    //collision code  
    if (Itimer>180) {
      int t=0;
      while (t<myObjects.size()) {
        GameObject obj =myObjects.get(t);
        if (obj instanceof Hero && isCollidingWith(obj)) {
          obj.hp=obj.hp-5;
          Itimer=0;
        }
        t++;
      }
    }
  }
}

//------------------------------------------------------------------------

class FolShooter extends Enemy { // shooter
  int FStimer;

  FolShooter(int rx, int ry) {
    super(150, 60, rx, ry);  //hp, size, roomx, roomy 
    FStimer=0;
    xp=10 +myHero.betterxp;
  }
  void show() {
    strokeWeight(4);
    fill(black);
    circle(150, height/2, size);
    FStimer=FStimer+1;
    vx=myHero.location.x-location.x; 
    vy=myHero.location.y-location.y;
  }

  void act() {
    super.act();
    while (FStimer==100) {
      myObjects.add(new Follower(roomx, roomy, 30)); // roomx, roomy size
      FStimer=0;
    }

    int j=0;
    while (j<myObjects.size()) {
      GameObject obj =myObjects.get(j);
      if (obj instanceof Hero && isCollidingWith(obj)) {
        obj.hp=0;
      }
      j++;
    }
  }
}

//------------------------------------------------------------------------
class Follower extends Enemy {
  int folSIZE;

  Follower(int rx, int ry) {
    super(100, 50, rx, ry);  //hp, size, roomx, roomy 
    Itimer=180;
    location.x=random(150, 500);
    location.y=random(150, 400);    

    xp=5+myHero.betterxp;
    folSIZE=90;
  }
  Follower(int rx, int ry, int s) { // for follower shooter
    super(15, s, rx, ry);  //hp, size, roomx, roomy 
    Itimer=180;
       location=new PVector(150, height/2);

    s=size;
    folSIZE=60;
  }
  void show() {
    tint(255, 255, 255, 180);
    ghostLeft.show(location.x-35, location.y-30, folSIZE, folSIZE);
    tint(255, 255, 255);

    //immunity timer
    Itimer= Itimer+1;

  
  }
  void act() {
    super.act();

    velocity=new PVector(myHero.location.x-location.x, myHero.location.y-location.y);
    velocity.setMag(1);

    //collision code  
    if (Itimer>180) {
      int j=0;
      while (j<myObjects.size()) {
        GameObject obj =myObjects.get(j);
        if (obj instanceof Hero && isCollidingWith(obj)) {
          obj.hp=obj.hp-5;
          Itimer=0;
        }
        j++;
      }
    }   
    //-------------------
  }
}
