void intro() {
 rectMode(CENTER);
 textFont(creepy);
  noStroke();
  fill(blue);
  rect(width/2,height/2,width,height);
 
 
 
 //gif
  myGIF.show();
  
  //text
  fill(lightGrey);
  textAlign(CENTER);
  textSize(70);
  text("Haunted Mansion",width/2,200);  
 
 //start button
   click();  
 button1.show();
 button14.show();
 if (button1.clicked) {
mode=GAME;
}
 if (button14.clicked) {
mode=RULES;
}


 
}


//----------------------------------------------

void rules() {
    background(grey);
    fill(lightGrey);
    rect(width/2,45,250,75);
   fill(black);
   textSize(70);
  text("Rules",width/2,40); 
  textSize(25);
  fill(lightGrey);
  textAlign(LEFT);
  //rules
  text("Use a, w, s, d keys to move and p for the shop.",170,160); 
  text("Use your mouse to aim and spacebar to shoot.",170,250); 
  text("Avoid holes as they are deadly to touch. ",170,340); 
    text("Treasure chests drop loot when clicked.",170,430); 


 //images
 image(chest, 30, 370, 120, 120);
  image(scope, 60, 220, 50, 50);

 fill(black);
 circle(85, 335, 60);
 
 square(85,155,50);
 fill(lightGrey);
 textSize(30);
 text("A",78,162); 

  textAlign(CENTER);




   click();  

   button15.show();
  if (button15.clicked) {
mode=GAME;
}

  
}
