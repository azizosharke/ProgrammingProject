int i = 0 ; 
int a= 0;
void setup() {
  size(200,200);
  noStroke();
  fill ( 255, 204, 0) ;
  i =0 ; 
  a =-200;
}
void draw() {
  background(255);
  fill (0,255,0);
  rect(i,35,70,70);
  if (i++>=199){
    i=-200;
  }
  fill (0,255,0);
  rect(a,35,70,70);
  if (a++>=199){
    a=-200 ; 
  }
}
