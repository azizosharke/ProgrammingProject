/* Declare an arbombray of Aliens */
Alien theAliens[];
Player thePlayer;
Bullet theBullet[];
Bomb theBomb;
PImage bomb;
PImage alien;
PImage explosionImage;
int explode; 
int status;
int alienCount = 0;
void settings() { 
  size(SCREENX, SCREENY);
}
void setup() {
  /* create a new alien array */
  /* load the images */
  /* initialise the array */
  frameRate(60);
 
  alien=loadImage("spacer.gif");
  explosionImage=loadImage("exploding.gif");
  thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT);
  ellipseMode(RADIUS);
  theAliens = new Alien[10];
  theBullet = new Bullet[40000];
  init_array(theAliens);
  bomb = loadImage("bomb.png");
  theBomb = new Bomb(SCREENX/2, 30, bomb);
}

void draw() {
  background (255);
  draw_array(theAliens);
  move_array(theAliens);
  thePlayer.move(mouseX);
  thePlayer.draw();
  thePlayer.shootBullet();
  shoot_array(theBullet);
  lossGame();
  wonGame();

}

void wonGame() {  
  if (alienCount==10) {                                                                   // if i killed all 10 i win
    background(0);
    textSize(30);
    fill(200, 0, 150);
    text("YOU WON", 215, 330);
    text("Congrats", 210, 280);
  }
}
void lossGame() {
  if (theBomb.collided(thePlayer)) {                                                       // if it the player colldied with bomb , game over 
    theBomb.speed=0;
    background(0);
    textSize(30);
    fill(150, 0, 200);
    text("YOU LOST", 215, 330);
    text("GAME OVER", 210, 280);
  }
}

/* clear the screen */
/* for each alien in the array - move the alien, then draw the alien */

void mouseReleased() {
  thePlayer.limit=0;
}


 
void draw_array(Alien theAliens[]) {                                       // alien draw and shot random of the aliens per 1 
  for (int i= 0; i<theAliens.length; i++) {
    theAliens[i].draw();
    theAliens[int (random(0, 10))].shootBomb();
  }
}
void init_array (Alien theAliens[]) {
  for (int i=0; i<theAliens.length; i++) {
    theAliens[i] = new Alien(1+i*35, 10, alien, bomb);                           
  }
}
void shoot_array(Bullet theBullets[]) {                                   // bullet as many times as i can 
  for (int i=0; i<thePlayer.count; i++) {
    theBullet[i].draw();
    theBullet[i].move();
    
    theBullet[i].collide(theAliens, explosionImage);
  }
}
void move_array(Alien theAliens[]) {                                         // movement of aliens 
  for (int i= 0; i<theAliens.length; i++) {
    theAliens[i].move();
  }
}
