class Alien {
int x, y, direction;
int status;
int bombIndex;
PImage normalImg, explodeImg, bombPic , bulletPic;
boolean tryBomb;
Bomb theBomb;
 int countDown;
 int directionCheck;
 int dx;
 int dy;
  Alien (int xpos, int ypos, PImage okImg, PImage exImg, PImage bombImg , PImage bulletImg){
    x = xpos;
    y = ypos;
    status = ALIEN_ALIVE;
    normalImg = okImg;
    explodeImg = exImg;
    direction = A_FORWARD;
    bombPic = bombImg;
    bulletPic = bulletImg ;
    tryBomb = true;
  }
  void move(){
   if (countDown == 0 && directionCheck == A_FORWARD)
    {
      dx=1;                             // to be at the same frame at right  
      dy=0;                             // to keep it going in order not to go diagonally at rigth 
      directionCheck =A_BACKWARD;
      countDown = normalImg.width; // to loop back when it hits thr wall the the other side
    } else if (countDown == 0 &&directionCheck == A_BACKWARD)
    {
      dx=-1;       // to be at the same frame at left
      dy=0;        // to keep it going in order not to go diagonally at left
      directionCheck = A_FORWARD; // to keep looping back 
      countDown = normalImg.width; // to loop back when it hits the wall
    }
    x+=dx;     // to start moving 
    y+= dy;   // to keep moving forward and keep going down 
    if (x == 0)
    {
      dy=1;
      dx=0;
      countDown--; // to not go striaght down like a line at the left hand side
    }
    if (x == SCREENX-normalImg.width) // to make sure when it reaches the frame it hits back AND not going down 

    {
      dy=1; // make sure it snaps back when it hit the wall 
      dx=0; // make sure it will not fall away when it reaches the right frame 
      countDown--; // make sure it will not fall away when it reaches the right frame
    }
    
    if(x == (int)random(0, 300) && tryBomb && status == ALIEN_ALIVE){                        // the rate in which it drops the bombs                       
      theBomb = new Bomb(x + 10, y + 50, bombPic);                                           // bomb dimensions 
      tryBomb = false;
    }
    if(theBomb != null)                                                       // if it not null , boom will be dropped 
      theBomb.move(); 
  }
  int width(){
      return 0;
  }
  
  int height(){
    return 0;
  }
  
  Bomb getBomb(){
    return  theBomb;
  }
  
  void draw(){
    if(status==ALIEN_ALIVE)
      image(normalImg, x, y);
    else if(status!=ALIEN_DEAD){
      image(explodeImg, x, y);
      status++;
    }
  // otherwise dead, don't draw anything
  }
  
  void die(){
    if(status==ALIEN_ALIVE)
      status++;
  }

}
