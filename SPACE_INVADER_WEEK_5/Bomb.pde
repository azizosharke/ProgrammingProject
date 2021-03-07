class Bomb{
  int xPos, yPos;
  PImage bomb;
  
  Bomb(int x, int y, PImage bombImg){                                      // bomb constructor 
    xPos = x;
    yPos = y;
    bomb = bombImg;
  }
  
  boolean collided(Player myPlayer){
    if(xPos + 30 > myPlayer.xpos && 
       xPos < myPlayer.xpos + PADDLEWIDTH && 
       yPos + 30 > myPlayer.ypos &&
       yPos < myPlayer.ypos + PADDLEHEIGHT){
         return true;
       }
       return false;
  }
  
  boolean offScreen(){
    if(yPos >= SCREENY)
      return true;
    return false;
  }
    
  void move(){                                                       // speed of the bomb 
    yPos+=1;                    
  }
  
  void draw(){
      image(bomb, xPos, yPos, 25, 25);                                // size of the photo 
  }
}
