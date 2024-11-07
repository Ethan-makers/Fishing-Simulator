class Shark {
  //Fields
  PVector pos, vel;
  float speed, Angle, size, sightRadius, nervousness,hunger;
  color col;
  Boolean chase;
  
  
  //Constructor
  Shark(float sspeed) {
    this.speed = sspeed;
    this.hunger = 3;
    this.size = 40;
    this.sightRadius = 200;
    this.nervousness = 1.3;
    this.pos = new PVector( random(0,1000), random(250,600)); 
    this.pickRandDirection();
    this.col = color(200);
    this.chase = false;
  }
  
  
  //Methods
  void drawShark() {
    fill(this.col);
    circle( this.pos.x, this.pos.y, this.size );
    quad(this.pos.x-(this.size/2)*cos(Angle+0.5),this.pos.y-(this.size/2)*sin(Angle+0.5),this.pos.x-(this.size/2)*cos(Angle-0.5),this.pos.y-(this.size/2)*sin(Angle-0.5),this.pos.x-(this.size)*cos(Angle-0.5),this.pos.y-(this.size)*sin(Angle-0.5),this.pos.x-(this.size)*cos(Angle+0.5),this.pos.y-(this.size)*sin(Angle+0.5));
    textSize(20);
    fill(255);
    text(int(this.hunger), this.pos.x-6, this.pos.y+6);
}
  
  
  void move() {
    //Check for each fish
    for (Fish F : n.f) {
      float distToFish = this.pos.dist( F.pos );
      
      //If fish is in sight, chase it
      if(distToFish <= this.sightRadius & F.caught == false & this.hunger<0) {
        this.swimTowards(F);
        this.chase = true;
      }
      //Eat fish if close enough
      if(distToFish < 10 & F.caught == false & this.hunger < 0) {
        F.caught = true;
        this.hunger += 5;
      }
      
    }  
    //Pick random direction if not chasing fish
    if(random(100) < this.nervousness & this.chase == false) {
        pickRandDirection();
      }
    
    //update values
    this.pos.add( this.vel );
    this.hunger -= 0.01;
    this.chase = false;
    
    //Keeps shark in boundaries
    if( ! SharkInBounds() ) {
      if (this.Angle <= PIE) 
        this.Angle += PIE;
      else if (this.Angle > PIE) 
        this.Angle -= PIE;
      this.pos.sub( this.vel );
    }
  }
  
  
  void pickRandDirection() {
    Angle = random(0, 2*PIE);
    PVector direction = new PVector( cos(Angle), sin(Angle) ); 
    this.vel = direction.mult( this.speed );
  }
  
  void swimTowards(Fish F) {
    PVector displacement = PVector.sub( F.pos, this.pos );
    Angle = displacement.heading(); //moves towards the fish
    PVector direction = new PVector( cos(Angle), sin(Angle) );
    this.vel = direction.mult( this.speed );
  }
  
  boolean SharkInBounds() {
    return this.pos.x > 0
        && this.pos.x < width
        && this.pos.y > 200
        && this.pos.y < height;   
  }
}
