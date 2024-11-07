class Boat {
  //Field
  PVector pos = new PVector();
  ArrayList<Fish> fishCaught;
  
  //Constuctor
  Boat(float x, float y) {
    pos.x = x;
    pos.y = y;
    fishCaught = new ArrayList();
  }
  
  //Methods
  void drawBoat() {
    fill(193, 154, 107);
    stroke(0);
    quad(this.pos.x,this.pos.y,this.pos.x+300,this.pos.y, this.pos.x+250,this.pos.y+50,this.pos.x+50,this.pos.y+50);
    noStroke();
  }
  
  void displayFishCaught() {
    textSize(20);
    fill(255);
    text(fishCaught.size()+" fish caught", 825, 50);
  }
}
