
PFont stdFont;
Screen screen, screen2, screen3;                                           // screen3 which keeps track of the current screen 
int screenNumber;
color screenColour;
ArrayList widgetList;
color red = color(255,0,0); 
color green = color(0,255,0);
color blue = color(0,0,255);
color lightBlue = color(68, 85, 90);
color white = color(255,255,255);
color gray = color(128,128,128);
void settings() {
  size (400,400);
}
void setup() {
background(0,0,0);
stdFont=loadFont("Chiller-Regular-36.vlw"); 
textFont(stdFont);                                                                        // font 
screen = new Screen(white);                                                               // background 
screen2 = new Screen(gray); 
screen3 = screen;
Widget widget1, widget2, widget3, widget4;
widget1=new Widget(120,80,150,40, "Button 1", color(red), stdFont, EVENT_BUTTON1);        // button colours 
widget2=new Widget(120,260,150,40, "Forward", color(green), stdFont, EVENT_BUTTON2);
widget3=new Widget(120,80,150,40, "Button 2", color(blue), stdFont, EVENT_BUTTON1);
widget4=new Widget(120,260,150,40, "Backward", color(lightBlue), stdFont, EVENT_BUTTON2);
widgetList = new ArrayList();
widgetList.add(widget1); widgetList.add(widget2);
screen.addWidget(widget1); 
screen.addWidget(widget2);
screen2.addWidget(widget3);
screen2.addWidget(widget4);
}
void draw(){
  strokeWeight(5);                                                           // which allows to define the border 
  screen3.draw();
}
void mouseMoved(){                                                         // for switching the borders 
int event;
for(int i = 0; i < screen3.widgetList.size(); i++) {
  Widget theWidget = (Widget) screen3.widgetList.get(i);
  event = theWidget.getEvent(mouseX, mouseY);
  switch(event) {
    case EVENT_BUTTON1:
    case EVENT_BUTTON2:
    case EVENT_BUTTONTry:
    theWidget.button.setStroke(color(255));                                  /// for the border of the button (white)
    break;
    case EVENT_NULL:
    theWidget.button.setStroke(color(0));                                   /// gone when the mouse is not on it (black)
   }
  }                
}
// border colour of a widget changes (to white) when
//the mouse pointer is over it but reverts to normal (black) when the mouse pointer is
// not over it. This must work independently for each of your widgets
void mousePressed() {                                                                  // square displayed on the screen changes colour 
  int event;
  event = screen3.getEvent();
  switch(event) {
    case EVENT_BUTTON1: 
    println((screen3 == screen)? "button 1 was clicked " : "button 2 was clicked ");                     // switch between button1  and button 2 
    break;
    case EVENT_BUTTON2:
    screen3 = (screen3 == screen)? screen2: screen;
    println((screen3 == screen)? "backward known as button 2" : "forward known as button 1");
    break;
    
    //square displayed on the screen changes colour (to
   //the named colour) as each button is pressed.
  }
}
