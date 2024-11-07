class nature {
  //Fields
  float TimeOfDay, waterTemp;
  Fish[] f;
  Shark[] s;
  
  //Constructor
  nature(int ns,float ss,float fs) {
    TimeOfDay = 0;
    this.waterTemp = random(60,90);
    int numFish = int((-0.125)*pow((this.waterTemp-75),2)+35); //quadradic equation for fish population based on water tempreture with max fish population of 35 at 75 degrees fahrenheit
    this.f = new Fish[ numFish ];
    this.s = new Shark[ ns ];
    
    for(int i = 0; i < numFish; i++) {
      this.f[i] = new Fish(fs);
    }
    for(int i = 0; i < ns; i++) {
      this.s[i] = new Shark(ss);
    }
  
  }
  
  //Methods
  void drawBackground() {
    //Draw Sky
    float B = (-20)*pow((this.TimeOfDay-PIE),2)+200; //quadradic equation for the colour of the sky based on the time of day
    background(0,0,B);
    //Draw Sun
    float SunX = width/2 + cos(0.5*TimeOfDay+PIE) * 500;
    float SunY = 525 + sin(0.5*TimeOfDay+PIE) * 500;
    fill(249,215,28);
    circle(SunX,SunY,30);
    //Draw Water
    fill(0,100,180);
    rect(0,200,1000,600);
    //Text
    textSize(20);
    fill(255);
    text("Water Temp:"+int(this.waterTemp)+"°F", 25, 225);
    textSize(30);
    text("Day "+Day, 25, 50);
  }
}
