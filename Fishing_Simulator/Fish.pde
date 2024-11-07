class Fish {
  //Fields
  PVector pos, vel;
  float speed, Angle, size, sightRadius, nervousness;
  color col;
  Boolean caught, chase;
  
  
  //Constructor
  Fish(float fspeed) {
    this.speed = fspeed;
    this.size = random(15,25);  
    this.sightRadius = random(80,120);
    this.nervousness = random(1,1.5);
    this.pos = new PVector( random(0,1000), random(250,600)); 
    this.pickRandDirection();
    this.caught = false;
    this.col = color(random(200,255),random(100,220),random(0,100));
    this.chase = false;
  }
  
  
  //Methods
  void drawFish() {
    if (this.caught == false) { //Doesn't draw fish that haven't been caught
      fill(this.col);
      //Body
      circle( this.pos.x, this.pos.y, this.size );
      //Tail
      quad(this.pos.x-(this.size/2)*cos(Angle+0.5),this.pos.y-(this.size/2)*sin(Angle+0.5),this.pos.x-(this.size/2)*cos(Angle-0.5),this.pos.y-(this.size/2)*sin(Angle-0.5),this.pos.x-(this.size)*cos(Angle-0.5),this.pos.y-(this.size)*sin(Angle-0.5),this.pos.x-(this.size)*cos(Angle+0.5),this.pos.y-(this.size)*sin(Angle+0.5));
    }
  }
  
  
  void move() {
    if (this.caught == false) { //Doesn't move fish that have been caught
    float distToRod = this.pos.dist( r.pos );
    
      //Check for each shark
      for (Shark S : n.s) {
        float distToShark = this.pos.dist( S.pos );
        
        //Calculate what direction to swim
        if(distToShark <= this.sightRadius & r.fishCaught == false) { //avoid sharks
          this.swimAway(S);
          this.chase = true;
        }
        else if(distToRod <= this.sightRadius & r.fishCaught == false) { //swim towards rod
          this.swimTowards();
          this.chase = true;
        }
      }
      //Pick random direction if not chasing or being chased based on nervousness
      if(random(100) < this.nervousness & this.chase == false)
        pickRandDirection();
      
      //Check if fish is caught
      if(distToRod < 10 & r.fishCaught == false) {
        r.fishCaught = true;
        r.f = this;
        b.fishCaught.add(this);
        this.caught = true;
      }
      
      //update values
      this.pos.add( this.vel );
      this.chase = false;

      //Keeps fish in boundaries
      if( ! fishInBounds() ) {
        this.vel.mult(-1);
        if (this.Angle <= PIE) 
          this.Angle += PIE;
        else if (this.Angle > PIE) 
          this.Angle -= PIE;
        this.pos.add( this.vel );
      }
    }
  }
  
  
  void pickRandDirection() {
    Angle = random(0, 2*PIE);
    PVector direction = new PVector( cos(Angle), sin(Angle) ); 
    this.vel = direction.mult( this.speed );
  }
  
  void swimTowards() {
    PVector displacement = PVector.sub( r.pos, this.pos );
    Angle = displacement.heading(); //moves towards the rod
    PVector direction = new PVector( cos(Angle), sin(Angle) );
    this.vel = direction.mult( this.speed );
  }
  
  void swimAway(Shark S) {
    PVector displacement = PVector.sub( S.pos, this.pos );
    Angle = displacement.heading()+PIE; //moves opposite direction of the shark (180 degrees from the shark);
    PVector direction = new PVector( cos(Angle), sin(Angle) );
    this.vel = direction.mult( this.speed );
  }
  
  boolean fishInBounds() {
    return this.pos.x > 0
        && this.pos.x < width
        && this.pos.y > 200
        && this.pos.y < height;   
  }
}
