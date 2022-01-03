class Wall extends Enemy { // shooter
int wallx, wally;
int mTimer;

  Wall(int rx, int ry) {
     super(500,80,rx,ry);  //hp, size, roomx, roomy 
  wallx=width/2;
  wally=520;
    
    location.x=wallx;
    location.y=wally;
    mTimer=0;
    
    
   
  }
  void show() {
    fill(lightGrey);
     if (myHero.money<10) {
   rect(wallx,wally,100,10);
    mTimer++;
     }
 

  }
  
  void act() {
   //super.act();
   
   if (myHero.money<10) {
   // cannot cross blockage and message
   if (myHero.location.y>490 ) {
   myHero.location.y=490;  
     fill(lightGrey);
  text("You may pass once you have collected $10", width/2, 570);
 
   }
   }
   
   
   
  
   
  }
  }
//-------------------------------------------------------------------

class FinalWall extends Enemy { // shooter
int wallx, wally;
int mTimer;

  FinalWall(int rx, int ry) {
     super(500,80,rx,ry);  //hp, size, roomx, roomy 
  wallx=width/2;
  wally=520;
    
    location.x=wallx;
    location.y=wally;
    mTimer=0;
    
    
   
  }
  void show() {
    fill(lightGrey);
     if (myHero.purchasedWhiteCat!=1) {
   rect(wallx,wally,100,10);
    mTimer++;
     }
 

  }
  
  void act() {
   //super.act();
   
   if (myHero.purchasedWhiteCat==0) {
   // cannot cross blockage and message
   if (myHero.location.y>490 ) {
   myHero.location.y=490;  
     fill(lightGrey);
  text("You may pass once you have purchased princess cat", width/2, 570);
 
   }
   }
   
   
   
  
   
  }
  }


//-------------------------------------------------------------------

class Hole extends Enemy { // shooter

  Hole(float x, float y, int rx, int ry) {
     super(500,60,rx,ry);  //hp, size, roomx, roomy 
    location.x=x;
    location.y=y;

    
    
   
  }
  void show() {
    fill(black);
   ellipse(location.x,location.y,80,80);
    
 

  }
  
  void act() {
   //super.act();
   
         

   
      
       int j=0;
    while(j<myObjects.size()) {
     GameObject obj =myObjects.get(j);
  if(obj instanceof Hero && isCollidingWith(obj)) {
   obj.hp=0;
   }
    j++;
    } 
   
  }
   
  }
