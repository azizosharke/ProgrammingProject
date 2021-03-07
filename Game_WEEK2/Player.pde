class Player{ 
int xpos; 
int ypos;
int computerLives = 3;
int playerLives = 3;
float direction= 1.5;
float previousXPos = 0;
color paddlecolor = color(250);
Player(int screen_y)
{
  xpos=SCREENX/2;
  ypos=screen_y;
}

void move(int i){

if(i>(SCREENX - PADDLEWIDTH))        // it will put the paddle between the grounds of the screen 

{
  xpos = (SCREENX - PADDLEWIDTH);
  previousXPos = xpos;
}

else                                   // mouseX will control the movement of the paddle 
{
  xpos=i;
  previousXPos = xpos;
}
}
void draw(){
  
fill(paddlecolor);
rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
}

void compMove(float Ball){    // it will control the movement of the computer paddle
   if( xpos <= Ball)
  {
    xpos+=(direction);
    direction+= 0.0001; 
  }
  else if( xpos >= Ball ) {     //which  causes the shift distance to increase over time
    xpos-=(direction);
    direction+= 0.0001;
  }
}



}
