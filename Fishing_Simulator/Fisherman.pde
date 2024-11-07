class Fisherman {
  //Field
  Boat boat;
  Rod r;
  
  //Constuctor
  Fisherman(Boat b, Rod rod) {
    boat = b;
    Rod r = rod;
  }
  
  //Methods
  void drawFisherman() {
    fill(255,60,90);
    rect(boat.pos.x+65,boat.pos.y-25,30,25);
    fill(245,220,220);
    circle(boat.pos.x+80,boat.pos.y-40,30);
    fill(176, 169, 153);
    rect(boat.pos.x+60,boat.pos.y-55,40,5);
    rect(boat.pos.x+67,boat.pos.y-63,26,8);
  }
}
