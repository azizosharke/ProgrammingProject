class Screen{
ArrayList widgetList; 
color backgroundColor;

Screen(color backgroundColor) {
  this.backgroundColor = backgroundColor;
  widgetList = new ArrayList();
}

void draw() {                                                                     
  background(backgroundColor);                                                                               // draws the screens widgets 
  for(int i = 0; i < widgetList.size() ; i++) {                                 
    Widget theWidget = (Widget) widgetList.get(i);
    theWidget.draw(); 
  }
}

void addWidget(Widget widget) {                                          // adds a widget to array list 
  widgetList.add(widget);
}

int getEvent() {
  int event = 0;
  for(int i = 0; i < widgetList.size() ; i++) {                                           // returns an event 
    Widget theWidget = (Widget) widgetList.get(i);
    event = theWidget.getEvent( mouseX, mouseY);                                        // each screen has its own backgroud 
    if(event != EVENT_NULL)
    break;
  }
  return event;
}

}
