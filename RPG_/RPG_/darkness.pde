class Darkness {
  float opacity;
  float x, y, size, d;


  Darkness (float _x, float _y, float s) {
    size=s;
    x=_x;
    y=_y;
    opacity=100;
  }
  void show() {
    rectMode(CORNER);
    noStroke();
    

    fill(indigo, opacity);
    square(x, y, size);

    d=dist(myHero.location.x, myHero.location.y, x, y);
    opacity=map(d, 50, 100, 0, 30);
    

  }
  void act() {
  }
}
