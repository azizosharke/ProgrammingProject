  
Player thePlayer;
Player computerPlayer;
Ball theBall;
boolean gameTimer = false;
void settings() {
  size (320, 240);  
}
void setup(){ 
thePlayer = new Player(SCREENY-PADDLEHEIGHT-BOUNDARY);
computerPlayer = new Player(BOUNDARY);
theBall = new Ball();
ellipseMode(9);
frameRate(200);
}
void draw() {   
  background(0);                    // it will show the number of the lives you have on the left and right hand sides 
  thePlayer.draw();
  computerPlayer.draw();
  rect(0, 120, 330, 4);
  textSize(50);
  fill(0, 255, 0);
  text(computerPlayer.computerLives , 280, 50);
  fill(0, 0, 255);
  text(thePlayer.playerLives , 20, 230);
  if (gameTimer == true){ 
    thePlayer.draw();
    computerPlayer.draw();
    theBall.draw();
    thePlayer.move(mouseX);
    theBall.move();
    theBall.collide(thePlayer);
    computerPlayer.compMove(theBall.x);
    theBall.computerCollide(computerPlayer);
  }
  
  else{
     if(computerPlayer.computerLives == 0)     //  WIN message
    {
      fill(255);
      textSize(10);
      text("YOU WIN!", 130, 140);
      text("Press Mouse Key to Play Again", 100, 115);
    }
    else if(thePlayer.playerLives == 0) // GAME OVER message
    {
      fill(255);
      textSize(10);
      text("GAME OVER!", 130, 140);
      text("Press Mouse Key to Play Again",100 , 115);  //  START THE GAME  message 
    }
    else{
      fill(255);
      textSize(10);
      text("Press Mouse Key to Play", 100, 115);
    }
  } 
}
void mousePressed() {
    gameTimer = !gameTimer;                     // it willl reset the speed x and y for the ball as well as the boolean 
  theBall.distanceY = random(1, 2);
  theBall.distanceX= random(1, 2);
   if(thePlayer.playerLives == 0){              //  it will resest player lives after 3 tries 
    computerPlayer.computerLives = 3;
    thePlayer.playerLives = 3;
  }
   if(computerPlayer.computerLives == 0){      // it will reset computer lives after 3 tries 
    computerPlayer.computerLives = 3;
    thePlayer.playerLives = 3;
  }
}
