void bank () {
  background(0);

  textSize(80);
  fill(lightGrey);
  text("BANK", width/2, 50);
 
 //money and xp counters
    fill(darkBlue);
   noStroke();
  ellipse(width/2, 550,250,50);
  
 textSize(25);
 fill(lightGrey);
  text("xp: "+myHero.xp, width/2+50, 550); //xp counter
  text("$ "+myHero.money,width/2-50, 550);

  click();  
 
  button8.show(); //back
   button12.show(); //button 1
    button13.show(); //button 2
   
    //coin images
    fill(yellow);
  circle(width/2-90, 220, 50);
  fill(0);
  textSize(30);
  text("$", width/2-90, 220); 
  
  fill(yellow);
   circle(width/2-90, 350, 50);
  fill(0);
  textSize(30);
  text("$", width/2-90, 350); 
  
   text("XP", width/2+90, 220); 
    text("XP", width/2+90, 350); 

  if (button8.clicked) mode=UPGRADE;
    if (button12.clicked) ; //coin to xp
   if (button13.clicked) ; //xp to coins
   imageMode(CENTER);
    image(arrowL,width/2,350,100,100);
 image(arrowR,width/2,220,100,100);
 imageMode(CORNER);
 
 fill(lightGrey);
     text("  $ 1  =  5 XP ", width/2, 460);

     
     if (button12.clicked && myHero.money>=1) {
   myHero.money=myHero.money-1;
   myHero.xp=myHero.xp+5;
  }
     if (button13.clicked && myHero.xp>=5) {
    myHero.xp=myHero.xp-5;
    myHero.money=myHero.money+1;
  }


}
