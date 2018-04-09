class rocket {
  //variables
  private PVector pos, vel, acc, grav;
  int RWidth, RHeight, rotation, engineH, fuelH, headH, weight;
  PShape engine, fuel, head;

  //constructor
  rocket(int Width, int Height, color eC, color fC, color hC, float grav, int weight) {
    this.pos = new PVector(width/2, height);
    this.vel = new PVector(0, 0);
    this.acc = new PVector(0, 0);
    RWidth = Width;
    engineH = int(Height*0.2);
    fuelH = Height;
    headH = int(Height*0.2);
    engine = drawEngine(eC);
    fuel = drawFuel(fC);
    head = drawHead(hC);
    this.grav = new PVector(0, grav);
    this.weight = weight;
  }

  void display() {
    shapeMode(CORNER);
    shape(engine, pos.x-(RWidth/2), pos.y);
    shape(fuel, pos.x-(RWidth/2), pos.y - engineH);
    shape(head, pos.x-(RWidth/2), pos.y - (fuelH + headH));
    move();
    /* 
     if i implement a store system or something like it
     if(boosterBought==true){
     shape(booster, x, y); 
     }
     */
  }

  void move() {
    acc.add(grav.mult(weight));
    vel.add(acc);
    pos.add(vel);
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
}