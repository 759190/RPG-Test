class WinItem extends GameObject {

  color c;


  WinItem (float x, float y, int rx, int ry) {


    c=green;
    hp=1;
    location=new PVector(x, y);
    velocity=new PVector(0, 0);
    size=40;
    roomx=rx;
    roomy=ry;
  }

  void show() {
    imageMode(CENTER);
 image(gem,width/2,height/2,80,80);
   
    imageMode(CORNER);
  }
  void act() {

    int j=0;
    while (j<myObjects.size()) {
      GameObject obj =myObjects.get(j);
      if (obj instanceof Hero && isCollidingWith(obj)) {
        hp=0;
        mode=WIN;
      }
      j++;
    }
  }
} //end
