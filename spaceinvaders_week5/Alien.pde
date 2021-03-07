class Alien {

  PImage spacerImage;
  PImage image;
  int status;
  PImage bombL;
  int x = 0;
  int y =0 ;
  int direction ;
  int count = 0;
  int countDown;
  int directionCheck;
  int dx;
  int dy;



  Alien(int xpos, int ypos, PImage spacerImage, PImage bombImage) {                             // constructor for alien 
    x = xpos;
    y = ypos;
    image = spacerImage;
    bombL = bombImage;
    status = 1;
  }

  void theExplosion (PImage alienExplosion) {                                                      // explosion part 
    image=alienExplosion;
    status=ALIEN_DEAD;
    alienCount++;
  }


  void draw() {
    image(image, x, y);
  }
  void move() {
   if (countDown == 0 && directionCheck == A_FORWARD)
    {
      dx=1;                             // to be at the same frame at right  
      dy=0;                             // to keep it going in order not to go diagonally at rigth 
      directionCheck =A_BACKWARD;
      countDown = image.width; // to loop back when it hits thr wall the the other side
    } else if (countDown == 0 &&directionCheck == A_BACKWARD)
    {
      dx=-1;       // to be at the same frame at left
      dy=0;        // to keep it going in order not to go diagonally at left
      directionCheck = A_FORWARD; // to keep looping back 
      countDown = image.width; // to loop back when it hits the wall
    }
    x+=dx;     // to start moving 
    y+= dy;   // to keep moving forward and keep going down 
    if (x == 0)
    {
      dy=1;
      dx=0;
      countDown--; // to not go striaght down like a line at the left hand side
    }
    if (x == SCREENX-image.width) // to make sure when it reaches the frame it hits back AND not going down 

    {
      dy=1; // make sure it snaps back when it hit the wall 
      dx=0; // make sure it will not fall away when it reaches the right frame 
      countDown--; // make sure it will not fall away when it reaches the right frame
    }
 }
    
  void shootBomb() {                                                  // every time the bomb goes off the screen , it makes a new bomb 
    if (theBomb.offScreen() && status == ALIEN_ALIVE) {   
      println("Shot");
      theBomb = new Bomb(x + 10, y + 50, bombL);                     // constructor for bomb dimensions 
    }
    if (theBomb != null) {    
      theBomb.draw();
      lossGame();
      wonGame();
      theBomb.move();
    }
  }
}
