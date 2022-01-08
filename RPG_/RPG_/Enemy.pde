class Enemy extends GameObject {

  int RandomDrop;
  
  

  Enemy(int rx, int ry) {
    //location=new PVector(300, 200);
     location.x=random(150,500);
    location.y=random(150,400);
    velocity=new PVector(0, 0);
    hp=100;
    roomx=rx;
    roomy=ry;
    size=50;
    xp=5+myHero.betterxp;
  }
  Enemy(int hitp, int s, int rx, int ry ) {
    location=new PVector(150, 300);
    velocity=new PVector(0, 0); 
    hp=hitp;
    roomx=rx;
    roomy=ry;
    size=s;
  }
  void show() {

    tint(255, 200);
    image(ectoplasm, location.x-40, location.y-38, 80, 80);
    tint(255);
    //immunity timer
    Itimer=Itimer+1;
    println(Itimer);

   
  }
  void act() {
    super.act();

    // if hero hits enemy
    if (Itimer>180) {
      int j=0;
      while (j<myObjects.size()) {
        GameObject obj =myObjects.get(j);
        if (obj instanceof Hero && isCollidingWith(obj)) {
          obj.hp=obj.hp-10;
          Itimer=0;
        }
        j++;
      }
    } 


    //if bullet hits enemy
    int i=0;
    while (i<myObjects.size()) {
      GameObject obj =myObjects.get(i);
      if (obj instanceof Bullet && isCollidingWith(obj)) {
       

        hp=hp- int (obj.velocity.mag())-myHero.damage; //((Bullet) obj).damage;
        obj.hp=0;
        for (int t=0; t<10; t++) {
          myObjects.add(new Particle(location.x, location.y, roomx, roomy, 0));
        }



        if (hp<=0) {
          // hp=hp+myHero.betterxp;
          myHero.xp=myHero.xp+xp; // gives player xp
          myObjects.add(new Message(location.x, location.y, roomx, roomy, "x"+xp));
          for (int t=0; t<15; t++) {
            myObjects.add(new Particle(location.x, location.y, roomx, roomy, 255));
          }



          // ------------ Controls frequency of drops
          RandomDrop=int (random(0, 3));
          if (RandomDrop==0 ) {
            myObjects.add(new DroppedItem(location.x, location.y, roomx, roomy));
          }
        }
        //--------------- Controls frequency of drops
      }
      i++;
    } 
    //-----------------------------------------------------
  }
}
