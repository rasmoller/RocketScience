class rocket { //<>//
  //variables
  private PVector pos, vel, acc, grav;
  private int RWidth, RHeight, rotation, engineH, fuelH, headH, weight;
  private float ePower;
  private PShape engine, fuel, head;

  //constructor
  rocket(int Width, int Height, color eC, color fC, color hC, float grav, int weight) {
    this.pos = new PVector(width/2, height);
    this.vel = new PVector(0, 0);
    this.acc = new PVector(0, 0);
    RWidth = Width;
    rotation = 0;
    engineH = int(Height*0.2);
    fuelH = Height;
    headH = int(Height*0.2);
    RHeight = engineH + fuelH + headH;
    engine = drawEngine(eC);
    fuel = drawFuel(fC);
    head = drawHead(hC);
    ePower = 1;
    this.grav = new PVector(0, grav);
    this.weight = weight;
  }

  void display() {
    shapeMode(CORNER);
    shape(engine, pos.x, pos.y);
    shape(fuel,   pos.x, pos.y - engineH);
    shape(head,   pos.x, pos.y - (fuelH + headH));
    fill(255,0,0);
    ellipse(pos.x, pos.y, 30, 30);
    if (!pause) {
      move();
    }
    /* 
     if i implement a store system or something like it
     if(boosterBought==true){
     shape(booster, x, y); 
     }
     */
  }

  private void move() {
    println(grav.mult(weight));
    acc.add(grav.mult(weight));
    if (controls[1] == true) {
      applyForce(new PVector(sin(rotation)*ePower, -cos(rotation)*ePower));
    }
    
    if (pos.add(vel).y > height) {
      pos.y = height;
      acc.set(0, 0);
      acc.sub(vel.mult(0.1));
      vel.set(0, 0);
      
    }
    vel.add(acc);
  }

  void resetPos() {
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
    pos = new PVector(width/2, height);
  }
  
  void applyForce(PVector p){
  acc.add(p);
  }

  private PShape drawEngine(color c) {
    PShape e;
    e = createShape();
    e.beginShape();
    e.fill(c);
    e.vertex(20, -engineH);
    e.vertex(RWidth, 0);
    e.vertex(-RWidth, 0);
    e.vertex(-20, -engineH);
    e.endShape(CLOSE);
    return e;
  }

  private PShape drawFuel(color c) {
    PShape e;
    e = createShape();
    e.beginShape();
    e.fill(c);
    e.vertex(RWidth, 0);
    e.vertex(RWidth, -fuelH);
    e.vertex(-RWidth, -fuelH);
    e.vertex(-RWidth, 0);
    e.endShape(CLOSE);
    return e;
  }

  private PShape drawHead(color c) {
    PShape e;
    e = createShape();
    e.beginShape();
    e.fill(c);
    e.vertex(RWidth, 0);
    e.vertex(0, -headH);
    e.vertex(-RWidth, 0);
    e.endShape(CLOSE);
    return e;
  }
  int getHeight() {
    return engineH+fuelH+headH;
  }
  int getWidth() {
    return RWidth;
  }
  int getAltitude() {
    return height-int(pos.y);
  }
}