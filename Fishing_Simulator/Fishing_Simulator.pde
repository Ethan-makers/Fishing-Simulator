//Global variables
nature n;
Boat b;
Rod r;
Fisherman fisher;
int Day,numSharks,TimeSpeedMultiplier;
float sharkSpeed, fishSpeed;

void setup() {
  //Changable Varibales
  TimeSpeedMultiplier = 1; //If impatient (keep above zero)
  numSharks = 1;
  sharkSpeed = 0.8;
  fishSpeed = 0.6;
  
  //Create New Objects
  size(1000,600);
  n = new nature(numSharks,sharkSpeed,fishSpeed);
  b = new Boat(600,150);
  r = new Rod(b);
  fisher = new Fisherman(b,r);
  Day = 1;
}

void draw() {
  //Draw Static Objects
  n.drawBackground();
  b.displayFishCaught();
  b.drawBoat();
  fisher.drawFisherman();
  r.drawRod();
  
  //Update Time and Reset all Values Each Day
  if (n.TimeOfDay > 2*PIE) {
    println(b.fishCaught.size()+" fish caught on Day",Day);
    n = new nature(numSharks,sharkSpeed,fishSpeed); //replace the old objects to reset values
    b = new Boat(600,150);
    Day ++;
  }
  else {
    n.TimeOfDay += 0.001*TimeSpeedMultiplier;
  }   
  
  //Animate Catching Fish
  if (r.cast == false)
    r.updateHook();
  if (r.fishCaught == true & r.cast == true)
    r.catchfish();
 
  //Animate Fish
  for( Fish F : n.f ) {
    F.drawFish();
    F.move();
  }
  
  //Animate Shark
  for( Shark S : n.s ) {
    S.drawShark();
    S.move();
  }
}
