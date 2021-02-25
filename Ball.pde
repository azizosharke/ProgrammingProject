class Ball {  
float x; 
float y;
float distanceX; 
float distanceY;
int radius;

color ballColor = color(255, 0, 0);

Ball(){
  
x = random(SCREENX/4 , SCREENX/2);
y = random(SCREENY/4 , SCREENY/2);
distanceX = random(1, 2); // speedc Values of the ball
distanceY = random(1, 2);
radius=15;
}
void reset()
{
   gameTimer = false;
   x = random(SCREENX/4 , SCREENX/2);;
   y = random(SCREENY/4 , SCREENY/2);
   distanceX = 0;
   distanceY = 0;
}

void move(){


x = x+distanceX; //it will change the y and x place of the ball which depends on  the speed and distance values
y = y+distanceY;

if(y <= 0) // it will decrease the Computer lives
{
  computerPlayer.computerLives--;
  reset();
}
if(y >= SCREENY) //it will decrease the Player lives  
{
  thePlayer.playerLives--;
  reset();
}
}
void draw(){
  
fill(ballColor);
ellipse(int(x), int(y), radius, radius);
}
void collide(Player tp){
  
if(x-radius<= 0)// collision with left wall
{
  distanceX= -distanceX;
}

else if(x+radius>=SCREENX) // collision with right wall
{
  distanceX= -distanceX;
}

if(y<0) //it will reset the ball if it goes out the top of screen 
{
  reset();
  tp.computerLives--;
}
 
if(y>SCREENY)//it will reset the ball if it goes out the bottom of screen
{
  reset();
  tp.playerLives--;
}
if(y+radius >= tp.ypos && (y-radius)<tp.ypos+PADDLEHEIGHT //it will check if the ball collides with bottom paddle
&& x >=tp.xpos && x <= tp.xpos + PADDLEWIDTH)
{
  println("collided!");
  distanceY= -distanceY ;
  

}
}
void computerCollide(Player compPlayer)
{
  if((y-radius) <= compPlayer.ypos+PADDLEHEIGHT-5 && (y+radius) > compPlayer.ypos  //it will check if the ball collides with top paddle
  && x>=compPlayer.xpos && x <= compPlayer.xpos + PADDLEWIDTH)
{ 
  distanceY = -distanceY ;
}
}

}
