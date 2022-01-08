void gameover() {
   reset();
  background(darkBlue);
  fill(lightGrey);
  textSize(100);
  text("YOU LOSE",width/2,200);  
  click();  
 button2.show();
 if (button2.clicked) {
mode=INTRO;

 
 
} 
}

void win() {

   reset();
     noCursor();

  background(darkBlue);
  fill(lightGrey);
  textSize(100);
  text("YOU WIN!",width/2,200);  
  click();  
 button2.show();
 if (button2.clicked) {
mode=INTRO; 
}
 }

 
 
void reset() { //reset-------------------------------------------
  //create objects
  myObjects=new ArrayList<GameObject>(1000);
  myHero=new Hero();
  myObjects.add(myHero);

  myObjects.add(new FinalWall(3, 7));
  myObjects.add(new Wall(3, 1));

  myObjects.add(new FolShooter(6, 3));
  myObjects.add(new FolShooter(2, 6));

  myObjects.add(new WinItem(width/2, height/2, 3, 8));
  myObjects.add(new BouncerShooter(3, 8)); //final boss
  myObjects.add(new Follower(3, 8));
  myObjects.add(new Follower(3, 8));
  myObjects.add(new Follower(3, 8));


  myObjects.add(new Bouncer(2, 6));
  myObjects.add(new Bouncer(2, 6));



  //establishing cost
  coinCost=5;
  xpCost=10;
  bulletCost=5;

  //create darkness

  dark=new ArrayList<Darkness>(1000);
  int size=6;
  int x=0, y=0;
  int i=0;
  while (i<14500) {
    dark.add(new Darkness(x, y, size));
    x=x+size;
    if (x>width) {
      x=0;
      y=y+size;
    }

    i++;
  }

  //loading enemies from map
  x=0;
  y=0;
  while (y<map.height) {
    color roomColor = map.get(x, y);
    if (roomColor==room1) {

      myObjects.add(new Bouncer(x, y));
      myObjects.add(new Bouncer(x, y));  
      myObjects.add(new Bouncer(x, y));
      myObjects.add(new Bouncer(x, y));
      myObjects.add(new Bouncer(x, y));
    }
    if (roomColor==room2) {
      myObjects.add(new Follower(x, y));
      myObjects.add(new Tower(x, y));
    }
    if (roomColor==treasure) {
      myObjects.add(new Chest(x, y)); //chest
    }
    if (roomColor==room3) {
      myObjects.add(new Enemy(x, y));
      myObjects.add(new Enemy(x, y));
      myObjects.add(new Enemy(x, y));
    }
    if (roomColor==room4) {
      myObjects.add(new Follower(x, y));
      myObjects.add(new Follower(x, y));
      myObjects.add(new Follower(x, y));
      myObjects.add(new Follower(x, y));
    }
    if (roomColor==room5) {
      myObjects.add(new Hole(520, 170, x, y));
      myObjects.add(new Hole(width/2, 400, x, y));
      myObjects.add(new Hole(200, 200, x, y));
       myObjects.add(new Bouncer(x, y));
    myObjects.add(new Bouncer(x, y));
    myObjects.add(new Bouncer(x, y));
    }
   
    x++;
    if (x==map.width) {
      x=0;
      y++;
    }
  }
  
    }//end
