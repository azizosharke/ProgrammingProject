class Bomb {
  int xPosition = 0;
  int yPosition = 0;
  int shootBomb = 0;
  PImage bombImg;
  int speed =1;
  
 

  Bomb ( int x, int y, PImage bombImage) {                                                         // constructor 
    xPosition = x;
    yPosition = y;
    bombImg = bombImage;
  }
  void draw() {  
    image(bomb, xPosition, yPosition, 15, 15);                                                      // draw bomb image 
  }
  void move() {
    yPosition += speed;
  }
  boolean collided(Player thePlayer) {
    if (xPosition + 25 > thePlayer.xpos && xPosition < thePlayer.xpos + PADDLEWIDTH && yPosition + 25 >
      thePlayer.ypos && yPosition < thePlayer.ypos + PADDLEHEIGHT) {
      return true;
    }
    return false;
  }
  boolean offScreen() {                                                       // if the bomb has gone past the bottom of the screen 
    if (yPosition >= SCREENY)                                                          // true if it is , false if it is not 
    {
     
      return true;
    }
    return false;
  }
  
}

// when the bomb is inside of the alien:
// 1. the x of the alien is less than the bomb x: (x <= bomb.x)
// 2. the right side of the alien (x+alienwidth) must be greater than the bomb x: (x+alienwidth >= x+ bombwidth)
// 3. the y of the alien(the top of the alien), should be higher than the top of the bomb: (y <= bomb.y)
// 4. the bottom of the alien(y+alienheight) should be lower than the bottom o
