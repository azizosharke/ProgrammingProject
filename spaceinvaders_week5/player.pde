class Player {

  int count = 0;
  int xpos = 0; 
  int ypos = 0;
  int limit = 0;

  color paddlecolor = color(143, 56, 255);                              

  Player(int screen_y)
  {
    xpos=SCREENX/2;
    ypos=screen_y;
  }
  void move(int x) {
    if (theBomb.speed!=0) {

      if (x>SCREENX-PADDLEWIDTH) xpos = SCREENX-PADDLEWIDTH;
      else xpos=x;
    }
  }

  void draw() 
  {
    fill(paddlecolor);
    rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
  }
  void shootBullet() {
    if (mousePressed && limit==0) {
      theBullet[count] = new Bullet(xpos, 475);
      count++;
      limit=1;
    }
  }
}
