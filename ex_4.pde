
int i =0; 
int a =0;
int b= 0;
int c = 0;

void setup() {
  size (200,200);
  noStroke();
  fill(255,0,0);
  i =0;
  a =0;
  b =200;
  c =200;


}
void draw() {
  background(255);
  fill (255,0,0);
  rect(i,30,60,60);
  if (i--<=-59) {
  i =340;
}
  fill(0,255,0);
  rect(a,110,60,60);
  if (a++>=199) {
  a =-200;


}
 fill (255,0,0);
  rect(b,30,60,60);
  if (b--<=-59) {
  b =340;
}
fill(0,255,0);
  rect(c,110,60,60);
  if (c++>=199) {
  c=-200;



}

}
