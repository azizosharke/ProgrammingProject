class Alien {
  
 /* declare variables for alien position, direction of movement and appearance */
int x, y, direction;
int status;
PImage normalImg;
PImage explodeImg;
/* Constructor is passed the x and y position where the alien is to
 be created, plus the image to be used to draw the alien */
Alien (int xpos, int ypos, PImage okImg , PImage preImg){
    /* set up the new alien object */ 

x = xpos;
y = ypos;
status = ALIEN_ALIVE;
normalImg=okImg;
explodeImg = preImg;
direction=FORWARD;
}

void move(){
    /* Move the alien according to the instructions in the exercise */   

if(direction==FORWARD){                          // to be at the same frame at right  
if(x+normalImg.width<SCREENX-1)                  // to keep it going in order not to go diagonally at rigth 
x++;
else{
direction=BACKWARD; 
y+=normalImg.height+GAP;                         // to loop back when it hits thr wall the the other side
} 
}  
else if(x>0) x--;                                 // to be at the same frame at left
else {                                            // to keep it going in order not to go diagonally at left
direction=FORWARD;
y+=normalImg.height+GAP;
}
}
void draw(){
  /* Draw the alien using the image() method demonstrated in class */
if(status==ALIEN_ALIVE)
image(normalImg, x, y);
else if(status!=ALIEN_DEAD){
image(explodeImg, x, y);
status++;
}
// otherwise dead, don't draw anything
}
void die(){
if(status==ALIEN_ALIVE)    // to keep pattern of changing from alien to explode 
status++;
}
}
