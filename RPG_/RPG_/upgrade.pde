

void upgrade() {


  background(0);
  fill(lightGrey);
  textSize(50);
  text("UPGRADES", width/2, 50);
  textSize(30);          // cat = speed, invinciblity - double drop?
  text("Coin Value:  "+myHero.coinValue, 300, 150); // max hp, coin drop, hp drop (luck)
  text("Bullet Damage:  "+myHero.damage, 340, 300);
  text("More xp:  "+myHero.betterxp, 300, 450); //

  //money and xp counters
  fill(darkBlue);
  noStroke();
  ellipse(width/2, 550, 250, 50);

  textSize(25);
  fill(lightGrey);
  text("xp: "+myHero.xp, width/2+50, 550); //xp counter
  text("$ "+myHero.money, width/2-50, 550);




  click();  
  button9.show();// item 1
  button10.show(); // item 2
  button11.show(); // item 3
  button8.show(); // back
  button7.show(); // next

  if (button7.clicked) {
    mode=BANK;
  }
  if (button8.clicked) mode=SHOP;

  //coin value
  if (button9.clicked && myHero.xp>=coinCost) {
    myHero.coinValue=myHero.coinValue+1;
    myHero.xp=myHero.xp-coinCost;
    coinCost=coinCost*2;
  }
  //bullet damage
  if (button10.clicked && myHero.xp>=bulletCost) {
    myHero.damage=myHero.damage+1;
    myHero.xp=myHero.xp-bulletCost;
    bulletCost=bulletCost*2;
  }
  //more xp
  if (button11.clicked && myHero.xp>=xpCost) {
    myHero.betterxp=myHero.betterxp+1;
    myHero.xp=myHero.xp-xpCost;
    xpCost=xpCost*2;
  }

  //coin image
  fill(yellow);
  circle(100, 155, 50);
  fill(0);
  textSize(30);
  text("$", 100, 154); 

  //bullets image
  circle(80, 310, 5);
  circle(120, 310, 5);
  circle(100, 280, 5);
  //xp
  text("XP", 100, 450); 

  fill(255, 0, 0);

  //cost text
  
  noStroke();
  textSize(20);
  fill(255);
  //coin cost
  fill(lightGrey);
  rect(100, 150-50, 100, 25);
fill(0);
  text("XP: "+coinCost, 100, 150-50);
  //bullet cost
  fill(lightGrey);
  rect(100, 300-50, 100, 25);
fill(0);
  text("XP: "+bulletCost, 100, 300-50);
  //xp cost
    fill(lightGrey);
  rect(100, 450-50, 100, 25);
fill(0);
  text("XP: "+xpCost, 100, 450-50); 

}
