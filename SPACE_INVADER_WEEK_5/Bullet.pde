class Bullet {
  int xpos;
  int ypos;
  PImage bullet;
  int bulletradius;


  Bullet(int xpos, int ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
    bullet = bulletImg;
  }

  void move() {
    ypos-=3;
  }

  void draw() {
    image(bullet, xpos , ypos , 50 , 30);
  }

  void collide(Alien alien[]) {
    for (int i = 0; i < alien.length; i++) {
      if (xpos >= theAliens[i].x && xpos <= theAliens[i].x + WIDTH 
        && ypos >= theAliens[i].y && ypos <= theAliens[i].y + HEIGHT && theAliens[i].status == ALIEN_ALIVE) 
      {
        theAliens[i].status=EXPLODING;
        theAliens[i].normalImg = explodeImg;
      }
    }
  }
}


// when the bullet is inside of the alien:
// 1. the x of the alien is less than the bullet x: (x <= bullet.x)
// 2. the right side of the alien (x+alienwidth) must be greater than the bullet x: (x+alienwidth >= x+ bulletwidth)
// 3. the y of the alien(the top of the alien), should be higher than the top of the bullet: (y <= bullet.y)
// 4. the bottom of the alien(y+alienheight) should be lower than the bottom o
