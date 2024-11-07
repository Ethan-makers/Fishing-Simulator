class Rod {
  //Field
  PVector pos = new PVector();
  Boat b;
  Boolean cast, fishCaught;
  Fish f;
  
  //Constuctor
  Rod(Boat boat) {
    b = boat;
    pos.x = b.pos.x;
    pos.y = b.pos.y-20;
    cast = false;
    fishCaught = true;
  }
  
  //Methods
  void drawRod() {
    fill(92, 64, 51);
    quad(b.pos.x+65,b.pos.y-15,b.pos.x+65,b.pos.y-5,b.pos.x,b.pos.y-45,b.pos.x,b.pos.y-55);
    stroke(255);
    line(b.pos.x,b.pos.y-50,this.pos.x,this.pos.y);
    noStroke();
    fill(255,0,0);
    circle(this.pos.x,this.pos.y,10);
  }
  
  void updateHook() {
    this.pos.x /= 1.005;
    this.pos.y *= 1.015;
    if (this.pos.x <= 500 & this.pos.y >= 280) {
      this.cast=true;
      this.fishCaught = false;
    }
  }
  
  void catchfish() {
    this.pos.x *= 1.005;
    this.pos.y /= 1.015;
    
    //calculate direction of tail
    PVector displacement = PVector.sub( b.pos, this.pos );
    f.Angle = displacement.heading();
    
    //draw fish
    fill(f.col);
    circle( this.pos.x, this.pos.y, f.size );
    quad(this.pos.x-(f.size/2)*cos(f.Angle+0.5),this.pos.y-(f.size/2)*sin(f.Angle+0.5),this.pos.x-(f.size/2)*cos(f.Angle-0.5),this.pos.y-(f.size/2)*sin(f.Angle-0.5),this.pos.x-(f.size)*cos(f.Angle-0.5),this.pos.y-(f.size)*sin(f.Angle-0.5),this.pos.x-(f.size)*cos(f.Angle+0.5),this.pos.y-(f.size)*sin(f.Angle+0.5));

    if (this.pos.x >= b.pos.x & this.pos.y <= b.pos.y-20) {
      this.cast=false;
    }
  }
}
