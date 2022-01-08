int mode;
final int INTRO=0;
final int GAME=1;
final int BANK=2;
final int GAMEOVER=3;
final int SHOP=4;
final int UPGRADE=5;
final int WIN=6;
final int RULES=7;


//setting dropped item types
final int HEALTH=0;
final int GUN=1;
final int COIN=2;

int whichCat;
AnimatedGIF currentAction;


boolean mouseReleased;
boolean wasPressed;

color black=#1F1F20;
color darkBlue=#2B4C7E;
color blue=#567EBB;
color grey=#606D80;
color indigo=#090F27;
color lightGrey=#DCE0E6;
color yellow=#FFF36A;
color green=#7BAA16;

color room1=#171717; //salmon on cheat map
color room2=#101010; //green on cheat map
color room3=#040405; // blue on cheat map
color room4=#020203;  // pink on cheat map
color room5=#030203; //maroon on cheat map // actually pink
color treasure=#fff200;

PFont creepy; // font
boolean spacekey, akey, skey, wkey, dkey, onekey, twokey, threekey, pkey; //keys
int x, y;

PImage ectoplasm;
PImage floor;
PImage chest, openChest;
PImage scope;
PImage arrowL, arrowR;




//buttons
Button button1;
Button button2;
Button button3;
Button button4;
Button button5;
Button button6;
Button button7;
Button button8;
Button button9;
Button button10;
Button button11;
Button button12;
Button button13;
Button button14;
Button button15;

Button chestbutton;

AnimatedGIF myGIF;
//character gifs
AnimatedGIF orangeUp;
AnimatedGIF orangeDown;
AnimatedGIF orangeLeft;
AnimatedGIF orangeRight;
AnimatedGIF orangeStill;

AnimatedGIF whiteUp;
AnimatedGIF whiteDown;
AnimatedGIF whiteLeft;
AnimatedGIF whiteRight;
AnimatedGIF whiteStill;

AnimatedGIF blackUp;
AnimatedGIF blackDown;
AnimatedGIF blackLeft;
AnimatedGIF blackRight;
AnimatedGIF blackStill;

AnimatedGIF ghostLeft;
AnimatedGIF ghostRight;


Hero myHero;

//Image
PImage map;
PImage gem;
color northRoom, eastRoom, southRoom, westRoom;

//game objects
ArrayList<GameObject> myObjects;
ArrayList<Darkness> dark;

int bulletCost;
int xpCost;
int coinCost;

void setup () {
  //character gifs
  //orange cat
  noCursor();

  orangeUp=new AnimatedGIF(12, 2, "orangeUP/sprite_", ".png"); 
  orangeDown=new AnimatedGIF(12, 2, "orangeDOWN/sprite_", ".png"); 
  orangeLeft=new AnimatedGIF(12, 4, "orangeLEFT/sprite_", ".png");
  orangeRight=new AnimatedGIF(12, 4, "orangeRIGHT/sprite_", ".png"); 
  orangeStill=new AnimatedGIF(12, 1, "orangeSTILL/sprite_", ".png"); 
  //white cat
  whiteUp=new AnimatedGIF(12, 2, "whiteUP/sprite_", ".png"); 
  whiteDown=new AnimatedGIF(12, 2, "whiteDOWN/sprite_", ".png"); 
  whiteLeft=new AnimatedGIF(12, 4, "whiteLEFT/sprite_", ".png");
  whiteRight=new AnimatedGIF(12, 4, "whiteRIGHT/sprite_", ".png"); 
  whiteStill=new AnimatedGIF(12, 1, "whiteSTILL/sprite_", ".png"); 
  //black cat
  blackUp=new AnimatedGIF(12, 2, "blackUP/sprite_", ".png"); 
  blackDown=new AnimatedGIF(12, 2, "blackDOWN/sprite_", ".png"); 
  blackLeft=new AnimatedGIF(12, 4, "blackLEFT/sprite_", ".png");
  blackRight=new AnimatedGIF(12, 4, "blackRIGHT/sprite_", ".png"); 
  blackStill=new AnimatedGIF(12, 1, "blackSTILL/sprite_", ".png"); 

  //ghost
  ghostLeft=new AnimatedGIF(15, 2, "ghostLEFT/sprite_", ".png"); //left
  ghostRight=new AnimatedGIF(15, 2, "ghostRIGHT/sprite_", ".png"); //right

  ectoplasm=loadImage("ectoplasm.png"); 
  floor=loadImage("floor.png"); 



  size(800, 600);
  creepy=createFont("creepy.ttf", 200); //font

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




  button1=new Button ("START", width/2, 320, 250, 100, blue, darkBlue); //start button
  button2=new Button ("Try Again", width/2, 450, 250, 120, blue, darkBlue); //gameover button
  button3=new Button ("GAME", 100, 60, 110, 50, blue, darkBlue); //shop button
  button4=new Button ("", width/2-200, 250, 200, 250, blue, darkBlue); // cat 1
  button5=new Button ("", width/2, 250, 200, 250, blue, darkBlue); //cat 2
  button6=new Button ("", width/2+200, 250, 200, 250, blue, darkBlue); //cat 3
  button7=new Button ("NEXT", 700, 550, 110, 50, lightGrey, black); //next button
  button8=new Button ("BACK", 100, 550, 110, 50, lightGrey, black); //back button


  button9=new Button ("", 100, 150, 100, 100, blue, darkBlue); //item 1
  button10=new Button ("", 100, 300, 100, 100, blue, darkBlue); //item 2
  button11=new Button ("", 100, 450, 100, 100, blue, darkBlue); //item 3
  button12=new Button ("", width/2, 220, 300, 100, blue, darkBlue); //bank button 1
  button13=new Button ("", width/2, 350, 300, 100, blue, darkBlue); //bank button 2
  button14=new Button ("rules", width/2, 450, 250, 100, blue, darkBlue); //How to Play
  button15=new Button ("Play", width/2, 550, 150, 70, blue, darkBlue); //How to Play


  chestbutton=new Button ("", width/2, height/2, 60, 40, blue, darkBlue); //chest


  myGIF=new AnimatedGIF(5, 27, "frame_", "_delay-0.1s.gif", 0, 0, width, height); //intro gif

  map=loadImage("Map.png");
  gem=loadImage("Gem.png");
  chest=loadImage("closedchest.png");
  openChest=loadImage("openchest.png");
  scope=loadImage("scope.png");
  arrowL=loadImage("arrowleft.png");
  arrowR=loadImage("arrowright.png");





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
}

void draw() {







  if (mode==INTRO) {
    intro();
  } else if (mode==GAME) {  
    game();
  } else if (mode==BANK) {
    bank();
  } else if (mode==GAMEOVER) {
    gameover();
  } else if (mode==SHOP) {
    shop();
  } else if (mode==UPGRADE) {
    upgrade();
  } else if (mode==WIN) {
    win();
  } else if (mode==RULES) {
    rules();
  } else {
    println("Error: Mode= " + mode);
  }
  imageMode(CENTER);
  image(scope, mouseX, mouseY, 30, 30);
  imageMode(CORNER);
}
