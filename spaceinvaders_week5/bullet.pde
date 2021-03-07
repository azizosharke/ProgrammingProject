class Bullet {
  float x = 0;
  float y = 0;
  float dx = 0;
  float dy = 0;
  int radius = 0;

  color bulletColor = color(180, 54, 246);

  Bullet(int xpos, int ypos)
  {
    x = xpos;
    y = ypos;
    radius = 5;
  }

  void move()
  {
    y-=5;
  }

  void draw()
  {
    fill(bulletColor);
    ellipse(int(x), int(y), radius, radius);
  }
  void collide(Alien theAliens[], PImage explosionImage) {

    println("collided!");
    for (int i=0; i<theAliens.length; i++) {

      if (theAliens[i].y+25 >= y && theAliens[i].y <= y &&  
        theAliens[i].x+30 >= x+radius && theAliens[i].x <= x
        && theAliens[i].status==ALIEN_ALIVE) {
        theAliens[i].theExplosion(explosionImage);
      }
    }
  }
}

// when the bullet is inside of the alien:
// 1. the x of the alien is less than the bullet x: (x <= bullet.x)
// 2. the right side of the alien (x+alienwidth) must be greater than the bullet x: (x+alienwidth >= x+ bulletwidth)
// 3. the y of the alien(the top of the alien), should be higher than the top of the bullet: (y <= bullet.y)
// 4. the bottom of the alien(y+alienheight) should be lower than the bottom o
