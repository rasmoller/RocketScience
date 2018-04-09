class rocket{
 private PVector pos, vel, acc, grav;
 int RWidth, RHeight, rotation, engineH, fuelH, headH, weight;
 PShape engine, fuel, head;
 
 

rocket(int Width, int Height, color eC, color fC, color hC, float Grav){
  vel = new PVector(0,0);
  acc = new PVector(0,0);
  RWidth = Width;
  engineH = int(Height*0.2);
  fuelH = Height;
  headH = int(Height*0.2);
  engine = drawEngine(eC);
  fuel = drawFuel(fC);
  head = drawHead(hC);
  weight = Height*Width*5;
  //this.grav.y = -Grav;
  //this.grav.x = 0;
}

  void display(){
    shapeMode(CORNER);
    shape(engine,width/2, height);
    shape(fuel,  width/2, height - engineH);
    shape(head,  width/2, height - (fuelH + headH));
    
    /* if i implement a store system or something like it
    if(boosterBought==true){
     shape(booster, x, y); 
    }
    */
    
  }
  
  void calcmov(){
  //acc.add(grav*weight);
  pos.add(acc);
  }
  
  private PShape drawEngine(color c){
  PShape e;
  e = createShape();
  e.beginShape();
  e.fill(c);
  //e.vertex(0,0);
  e.vertex(20,-engineH);
  e.vertex(RWidth,0);
  e.vertex(-RWidth,0);
  e.vertex(-20,-engineH);
  e.endShape(CLOSE);
  return e;
  }
  private PShape drawFuel(color c){
  PShape e;
  e = createShape();
  e.beginShape();
  e.fill(c);
  e.vertex(RWidth,0);
  e.vertex(RWidth,-fuelH);
  e.vertex(-RWidth,-fuelH);
  e.vertex(-RWidth,0);
  e.endShape(CLOSE);
  return e;
  }
  private PShape drawHead(color c){
  PShape e;
  e = createShape();
  e.beginShape();
  e.fill(c);
  e.vertex(RWidth,0);
  e.vertex(0,-headH);
  e.vertex(-RWidth,0);
  e.endShape(CLOSE);
  return e;
  }
  int getHeight(){return engineH+fuelH+headH;}
  int getWidth(){return RWidth;}
}