int count =0;
Alien theAliens[];
Player thePlayer;
Bullet bullet[];
PImage normalImg ;
PImage explodeImg;
void settings() { 
  size(SCREENX, SCREENY);
}

void setup() {

  normalImg= loadImage("spacer.gif");
  explodeImg = loadImage("exploding.gif");
  theAliens = new Alien[10];
  bullet = new Bullet[1000000];
  frameRate(100);
  init_aliens(theAliens, normalImg, explodeImg);
  thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT);
}
void init_aliens(Alien theAliens[], PImage okImg, PImage preImg)
/* for each position in the array,  create a new alien at an appropriate
 starting point on the screen */
{


  theAliens[0] = new Alien(int(random(400, SCREENX - 100)), int(random(400, SCREENY - 100)), okImg, preImg); 
  for (int i=0; i<theAliens.length; i++) {
    theAliens[i] = new Alien(i*(okImg.width+GAP), 0, okImg, preImg);
  }
}
void draw() {
  background(255);
  /* for each alien in the array - move the alien, then draw the alien */

  for (int i=0; i<theAliens.length; i++) {
    theAliens[i].move();
    theAliens[i].draw();
  }

  thePlayer.move(mouseX);                   // movement of the player 
  thePlayer.draw();
  for (int i = 0; i < count; i++) {        // to keep adding bullets 
      bullet[i].move();
      bullet[i].draw();
      bullet[i].collide(theAliens);
  }
}  



void mousePressed() {
  bullet[count] = new Bullet(thePlayer.xpos + PADDLEWIDTH / 2, SCREENY);               // the bullet count when i press the mouse new bullet will be fired
  count++;
}
