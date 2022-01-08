color rectcolor;
boolean boughtOrange;
boolean boughtWhite;
int whiteCost;
int orangeCost;
void shop() {
  background(0);
  fill(lightGrey);
  textSize(50);
  
   //money and xp counters
    fill(darkBlue);
   noStroke();
  ellipse(width/2, 550,250,50);
  
 textSize(25);
 fill(lightGrey);
  text("xp: "+myHero.xp, width/2+50, 550); //xp counter
  text("$ "+myHero.money,width/2-50, 550);

  textSize(80);
  text("SHOP", width/2, 50);
  //boughtOrange=false;
  //boughtWhite=false;


  //speed text
  textSize(20);
  text("SPEED LEVEL: 1", width/2-200, 400);
  text("SPEED LEVEL: 2", width/2, 400);
  text("SPEED LEVEL: 3", width/2+200, 400);

  text("MAX HP: 100", width/2-200, 430);
  text("MAX HP: 150", width/2, 430);
  text("MAX HP: 200", width/2+200, 430);

  textSize(12);
  //text("If you want to unlock all features, contact Sarah with your PayPal info.", width/2, 590);





  // back to game button
  click();  
  button3.show(); //game
  button4.show(); //item 1
  button5.show(); // item 2
  button6.show(); //item 3
  button7.show(); // next


  orangeCost=25;
  whiteCost=50;

  if (button3.clicked) mode=GAME;
  if (button4.clicked ) {
    whichCat=3;
    currentAction = blackStill;
  }
  fill(200);
  if (button5.clicked && myHero.money>=orangeCost && boughtOrange==false) {
    myHero.money=myHero.money-orangeCost;
    boughtOrange=true;
  }

  if (boughtOrange==true) {
    whichCat=1;
    currentAction = orangeStill;
  }

  if (button6.clicked && myHero.money>=whiteCost && boughtWhite==false) {
    myHero.money=myHero.money-whiteCost;
    boughtWhite=true;
  } 
  if (boughtWhite==true) {
    whichCat=2;
    currentAction = whiteStill;
  }  


  if (button7.clicked) {
    mode=UPGRADE;
  }

  if (whichCat==1) {
    fill(lightGrey);
    rect(width/2, 250, 195, 245);
  }
  if (whichCat==2) {
    fill(lightGrey);
    rect(width/2+200, 250, 195, 245);
  }
  if (whichCat==3) {
    fill(lightGrey);
    rect(width/2-200, 250, 195, 245);
  }
 

  blackStill.show(100, 155, 200, 200);
  orangeStill.show(300, 155, 200, 200);
  whiteStill.show(500, 155, 200, 200);

 


    noStroke();
    fill(lightGrey);
    rect(width/2, 142, 190, 25);
    fill(0);
    text("Cost: $"+orangeCost, width/2, 142);
  
    noStroke();
    fill(lightGrey);
    rect(width/2+200, 142, 190, 25);
    fill(0);
    text("Cost: $"+whiteCost, width/2+200, 142);
  
  
  if (boughtOrange==false){
fill(blue);
    rect(width/2+200,250,195,245);
    fill(255);
    textSize(150);
    text("?", width/2+200, 250);
  }
   

  //rect(width/2,250,195,245);
  // rect(width/2-200,250,195,245);
}
