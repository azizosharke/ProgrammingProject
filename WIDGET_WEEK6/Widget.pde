class Widget {
int x, y, width, height;
String label; 
int event;
color widgetColor; 
color labelColor;
PFont widgetFont;
PShape button;
Widget(int x,int y, int width, int height, String label,                           // constructor for widget 
color widgetColor, PFont widgetFont, int event){
this.x=x;                                                                         // variable 
this.y=y;
this.width = width; 
this.height= height;
this.label=label; 
this.event=event;
this.widgetColor=widgetColor; 
this.widgetFont=widgetFont;
labelColor= color(0);
button = createShape(RECT, x,y,width,height);
button.setFill(widgetColor);
}
void draw(){
shape(button);
fill(widgetColor);
fill(labelColor);
text(label, x+10, y+height-10);
}
int getEvent(int mX, int mY){
if(mX>x && mX < x+width && mY >y && mY <y+height){
return event;
}
return EVENT_NULL;
}
}
