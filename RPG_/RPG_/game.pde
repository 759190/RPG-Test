
void game() {
  drawRoom();
  drawGameObjects();
 if (myHero.hp<=0) mode=GAMEOVER;
 
 if (pkey) mode=SHOP;

  
int i=0;
  while(i<dark.size()) {
    Darkness da =dark.get(i);
    da.show();
    da.act();
      i++;
   
    
  }
  drawMiniMap();
     

}

void drawMiniMap() {

  int size=10;
  int x=0,y=0;
  while (y<map.height) {
    color c=map.get(x,y);
    fill(c);
   noStroke();
  square(x*size+50,y*size+50,size);
  x=x+1;
  fill(blue);
 if (c== #ffffff) square(myHero.roomx*size+50,myHero.roomy*size+50,size);
  
if (x>=map.width) {
  x=0;
y=y+1;
}
  }
 fill (myHero.roomx*size+50,myHero.roomy*size+50,size); //USE COLOR C TO COLOR PIXEL

}



void drawGameObjects() {
  int i=0;
  while(i<myObjects.size()) {
    GameObject obj =myObjects.get(i);
    if (obj.inRoomWith(myHero)) {
    obj.show();
    obj.act();
   } // --------------- this brace only works if it is there?
    if (obj.hp<=0) {
      myObjects.remove(i);
    }else{
      i++;
    
     }

}
}
void drawRoom() {
  rectMode(CENTER);
  noStroke();
  //background
    strokeWeight(6);
  fill(darkBlue);
  rect(width/2,height/2,width,height);
  //line
  stroke(black);
  line(0,0,width,height);
  line(width,0,0,height);
  
  // draw exits
  //which directions have exits
  northRoom=map.get(myHero.roomx,myHero.roomy-1);
  eastRoom=map.get(myHero.roomx+1, myHero.roomy);
  southRoom=map.get(myHero.roomx, myHero.roomy+1);
  westRoom=map.get(myHero.roomx-1,myHero.roomy);
  
  //draw the doors where there are exits
  noStroke();
  fill(black);
  if(northRoom!=#FFFFFF) { 
    ellipse(width/2,100,100,100);
  }
  if(eastRoom!=#FFFFFF) {
     ellipse(width-120,height/2, 100,100);
  }
  if(southRoom!=#FFFFFF) {
    ellipse(width/2,height-100,100,100);
  }
   if(westRoom!=#FFFFFF) {
    ellipse(120,height/2,100,100);
  }
   //smaller rectangle
  fill(blue);
  stroke(black);
  rect(width/2,height/2,580,428);
  tint(#677498);

 image(floor,112,90,300,250);
  image(floor,388,90,300,250);
  image(floor,112,262,300,250);
  image(floor,388,262,300,250);

 tint(255);

  
  

}
