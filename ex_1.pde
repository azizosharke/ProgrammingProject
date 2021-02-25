
int i =0; 
int a =0;
int b=0;
void setup() {
  size (200,200);
  noStroke();
  fill(255,0,0);
  i =0;
  a=0;
  b=0;
  
}
void draw() {
  background(255);
  fill (255,0,0);
  rect(i,30,60,60);
  if (i--<=1) {
  i =260;
}
  fill(0,255,0);
  rect(a,30,60,60);
  if (a++>=199) {
  a =-60;
  }
  fill (0 , 0, 255);
  rect(30,b,60,60);
  if (b++>=199) {
  b =-59;
}

}
