rocket r1;
//                     Left,  Up,   Right, Down
boolean[] controls = {false, false, false, false};

void setup(){
  size(600,600);
  r1 = new rocket(50, 400, 135, 200, 200, 1, 1);
}

void draw(){
  background(255);
  r1.display();
  println(controls);
  println(r1.weight);
}

void keyPressed(){
  for(int i = 0; i < controls.length;i++){
    if(keyCode == 37+i){
      controls[i] = true;
    }
  }
  if(key == ' '){
  r1.resetPos();
  }

}
void keyReleased(){
  for(int i = 0; i < controls.length;i++){
    if(keyCode == 37+i){
      controls[i] = false;
    }
  }
}