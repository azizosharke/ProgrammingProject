Alien theAliens[];
Player thePlayer;
Bomb theBomb;
ArrayList theBullets;
PImage normalImg, explodeImg, bombImg , bulletImg;
int numberOfAliens;
boolean lossMessage;
boolean winMessage;
 
void settings(){
  size(SCREENX, SCREENY);
}
void setup(){
  numberOfAliens = 0;
  winMessage = false;
  lossMessage = false;
  bombImg = loadImage("bomb.png");
  normalImg = loadImage("spacer.gif");
  explodeImg = loadImage("exploding.gif");
  bulletImg = loadImage("bullet.png");
  theAliens = new Alien[10];
thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT);  
theBullets = new ArrayList();
  init_aliens(theAliens, normalImg, explodeImg);
}

void init_aliens(Alien theAliens[],  PImage okImg, PImage exImg){
  for(int i=0; i<theAliens.length; i++){
     theAliens[i] = new Alien(i*(20+GAP), 0, okImg, exImg, bombImg , bulletImg);
  }
}

void draw(){
  background(155);  
  thePlayer.move(mouseX);
  thePlayer.draw();
  
  for(int i = 0; i < theBullets.size(); i++)
  {
    Bullet myBullet = (Bullet) theBullets.get(i);
    
    if(myBullet != null){
      if(myBullet.xpos <= 0)
        theBullets.remove(i);
      myBullet.move();
      myBullet.collide(theAliens);
      myBullet.draw();
    }
  }
  
  for(int i=0; i<theAliens.length; i++){
    
    theAliens[i].move();
    theAliens[i].draw();
    
    if(theAliens[i].status == ALIEN_DEAD)
      numberOfAliens++;
      
    Bomb aBomb = theAliens[i].getBomb();
    if (aBomb!= null){
       if (aBomb.collided(thePlayer))
         lossMessage = true;
       else if(aBomb.offScreen()){
         theAliens[i].theBomb = null;
         theAliens[i].tryBomb = true;
       }
       aBomb.draw();
    }
  }
  if(numberOfAliens == 10)
    winMessage = true;
  else numberOfAliens = 0; 
  
  if(lossMessage)
    lossGame();
  if(winMessage)
    wonGame();
}
void lossGame(){
  background(0);
   textSize(30);
  fill(150, 0, 200);
  text("YOU LOST", 120, 200);
  text("GAME OVER" , 120 , 240 );
}
void wonGame(){
  background(0);
  textSize(30);
  fill(200, 0, 150);
  text("YOU WON", 120, 200);
  text("Congrats", 120, 240);
}

void mousePressed(){
  theBullets.add(new Bullet(thePlayer.x()+thePlayer.width/2, thePlayer.y()));
}
