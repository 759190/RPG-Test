class Chest extends GameObject {
  boolean open;
  Chest (int rx, int ry) {
    

    location.x=width/2;
    location.y=height/2;
    velocity=new PVector(0, 0);
    size=40;
    roomx=rx;
    roomy=ry;
  }

  void show() {
    imageMode(CENTER);
   chestbutton.show(); // next


    
    
    //open chest
    if (open==true) {
      image(openChest, width/2, height/2, 120, 120);
       
    } else {
      image(chest, width/2, height/2, 120, 120);
    }



 

 
    imageMode(CORNER);
  }





  void act() {
      click();  

    
     if (chestbutton.clicked && open==false) {
       open=true;
myObjects.add(new DroppedItem(width/2-18, height/2, roomx, roomy));
      myObjects.add(new DroppedItem(width/2+15, height/2+3, roomx, roomy));
       myObjects.add(new DroppedItem(width/2-3, height/2+25, roomx, roomy));
  }
  
  }
} //end
