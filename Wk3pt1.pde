/* Declare an Alien */
PImage alienImage;
Alien theAlien;
void settings() {
  size(600, 600);
}  
int xPos =1;
int yPos =1;
void setup(){
 /* create a new alien object */ 
  alienImage = loadImage("spacer.GIF");
 theAlien = new Alien(xPos, yPos, alienImage);
 frameRate(120);
}

void draw(){
  /* clear the screen */
  background(255):
  /* move the alien */
  theAlien.move();
  /* draw the alien */
  theAlien.draw();
}
