class Alien {

  /* declare variables for alien position, direction of movement and appearance */
  int x, y, direction;
  int status;
  PImage normalImg;
  PImage explodeImg;
  int countDown;
 int directionCheck;
  int dx;
  int dy;
  /* Constructor is passed the x and y position where the alien is to
   be created, plus the image to be used to draw the alien */
  Alien (int xpos, int ypos, PImage okImg, PImage preImg) {
    /* set up the new alien object */

    x = xpos;
    y = ypos;
    status = ALIEN_ALIVE;
    normalImg=okImg;
    explodeImg = preImg;
    
  }
  void move(){
  /* Move the alien according to the instructions in the exercise */   
  if(countDown == 0 && directionCheck == A_FORWARD)
  {
    dx=1;                             // to be at the same frame at right  
    dy=0;                             // to keep it going in order not to go diagonally at rigth 
    directionCheck = A_BACKWARD;
    countDown = normalImg.width; // to loop back when it hits thr wall the the other side
  }
  
 else if(countDown == 0 &&directionCheck == A_BACKWARD)
  {
    dx=-1;       // to be at the same frame at left
    dy=0;        // to keep it going in order not to go diagonally at left
    directionCheck = A_FORWARD; // to keep looping back 
    countDown = normalImg.width; // to loop back when it hits the wall
  }
  x+=dx;     // to start moving 
  y+= dy;   // to keep moving forward and keep going down 
  if(x == 0)
  {
    dy=1;
    dx=0;
    countDown--; // to not go striaght down like a line at the left hand side 
  }
  if(x == SCREENX-normalImg.width) // to make sure when it reaches the frame it hits back AND not going down 
  
  {
    dy=1; // make sure it snaps back when it hit the wall 
    dx=0; // make sure it will not fall away when it reaches the right frame 
    countDown--; // make sure it will not fall away when it reaches the right frame
  }
 } 
  

  
  void draw() {
    /* Draw the alien using the image() method demonstrated in class */
    if (status==ALIEN_ALIVE)
      image(normalImg, x, y);
    else if (status!=ALIEN_DEAD) {
      image(explodeImg, x, y);
      status++;
    }
    // otherwise dead, don't draw anything
  }
  void die() {
    if (status==ALIEN_ALIVE)    // to keep pattern of changing from alien to explode 
      status++;
  }
}
