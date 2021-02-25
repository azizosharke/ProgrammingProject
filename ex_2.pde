int i =0; 
void setup() {
  size (200,200);
  noStroke();
  fill(255,0,0);
  i =0;
}
void draw() {
  background(255);
  rect(i,30,60,60);
  if (i++>=199) {
  i =0;
}
}
