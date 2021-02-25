final int A_FORWARD = 0; // to loop back 
final int A_BACKWARD = 1; // too loop back 


class Alien 
{
 /* declare variables for alien position, direction of movement and appearance */
 int x;
 int y;
 int dx;
 int dy;
 int countDown;
 int directionCheck;
 int explodeA;
 int explodeB;
 PImage imageForProgram;
 /* Constructor is passed the x and y position where the alien is to
 be created, plus the image to be used to draw the alien */
 Alien(int xAxis, int yAxis, PImage alienImage)
 {
  /* set up the new alien object */ 
  x =xAxis;
  y = yAxis;
  dx = 1; // to make it move to the right 
  dy = 0; // make sure it's moving in a line 
 countDown= alienImage.width;
 directionCheck = A_BACKWARD;
  explodeA =1;
  explodeB =(int) random(0, (SCREEN_X*12)); // the rate in which it chnages from spacer to explode 
  imageForProgram = alienImage;
 }
 void move(){
  /* Move the alien according to the instructions in the exercise */   
  if(countDown == 0 && directionCheck == A_FORWARD)
  {
    dx=1;                             // to be at the same frame at right  
    dy=0;                             // to keep it going in order not to go diagonally at rigth 
    directionCheck = A_BACKWARD;
    countDown = alienImage.width; // to loop back when it hits thr wall the the other side
  }
  
 else if(countDown == 0 &&directionCheck == A_BACKWARD)
  {
    dx=-1;       // to be at the same frame at left
    dy=0;        // to keep it going in order not to go diagonally at left
    directionCheck = A_FORWARD; // to keep looping back 
    countDown = alienImage.width; // to loop back when it hits the wall
  }
  x+=dx;     // to start moving 
  y+= dy;   // to keep moving forward and keep going down 
  if(x == 0)
  {
    dy=1;
    dx=0;
    countDown--; // to not go striaght down like a line at the left hand side 
  }
  if(x == SCREEN_X-alienImage.width) // to make sure when it reaches the frame it hits back AND not going down 
  
  {
    dy=1; // make sure it snaps back when it hit the wall 
    dx=0; // make sure it will not fall away when it reaches the right frame 
    countDown--; // make sure it will not fall away when it reaches the right frame
  }
 } 
  void draw(){
    
    image(imageForProgram, x, y);  
    explodeA++; // make sure to have explode image at random  
}

  void explode(){
    
    if(explodeB == explodeA) // to keep pattern of changing from alien to explode 
    {
      imageForProgram  = explodeImage;
    }
}
}
