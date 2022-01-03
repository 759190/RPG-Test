class AnimatedGIF  {
  
  //instance variables
  PImage[]pics;
  int numFrames; //number of frames
  int currentFrame;
  float x,y,w,h;
  int rate;
  
  //constructor
    
   AnimatedGIF (int r, int nf, String pre, String post) { 
  x=width/2;
  y=height/2;
  w=width;
  h=height;
  rate=r;
  
  numFrames=nf;
   pics=new PImage[numFrames];
   int i=0;
   while (i<numFrames) {
    pics[i]=loadImage(pre+i+post); 
    i++;
   }
   currentFrame=0;  
   }
   
   
    AnimatedGIF (int r, int nf, String pre, String post, float _x, float _y, float _w, float _h) { //number of frames (temperary variable)
  x=_x;
  y=_y;
  w=_w;
  h=_h;
  rate = r;
  numFrames=nf;
   pics=new PImage[numFrames];
   int i=0;
   while (i<numFrames) {
    pics[i]=loadImage(pre+i+post); 
    i++;
   }
   currentFrame=0;  
   }

void show (float _x, float _y, float _w, float _h) {
  if (currentFrame >= pics.length) currentFrame = 0;
    image(pics[currentFrame], _x,_y,_w,_h);
    if (frameCount % rate == 0) currentFrame++;
}
   
   //behaviour
void show () {
  
  if (currentFrame >= pics.length) currentFrame = 0;
    image(pics[currentFrame], x,y,w,h);
    if (frameCount % rate == 0) currentFrame++;
  

}
}
