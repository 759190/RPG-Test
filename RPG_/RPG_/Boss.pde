class BouncerShooter extends Enemy { // shooter
 int BStimer;

  BouncerShooter(int rx, int ry) {
     super(500,80,rx,ry);  //hp, size, roomx, roomy 
     BStimer=0;
     //xp=10 +myHero.betterxp;
     location.x=width/2;
     location.y=height/2;
    

   
  }
  void show() {
    strokeWeight(4);
    //fill(green);
    //circle(150,height/2,size);
     tint(#81FF29,180);
       ghostLeft.show(location.x-75, location.y-55, 150, 150);
   tint(255);
    
    
   BStimer=BStimer+1;
    vx=myHero.location.x-location.x; 
    vy=myHero.location.y-location.y;
    
    
   
 
 

  }
  
  void act() {
   super.act();
   while (BStimer==100) {
    myObjects.add(new Bouncer(roomx,roomy)); // roomx, roomy size
      BStimer=0;
   }
      
   
      
       int j=0;
    while(j<myObjects.size()) {
     GameObject obj =myObjects.get(j);
  if(obj instanceof Hero && isCollidingWith(obj)) {
   obj.hp=0;
   }
    j++;
    } 
   
   
   
  } // end of act
} // end
