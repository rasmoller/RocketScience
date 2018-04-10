rocket r1;
//                     Left,  Up,   Right, Down
boolean[] controls = {false, false, false, false};
boolean pause = false;

void setup() {
  size(600, 600);
  r1 = new rocket(50, 400, 135, 200, 200, 1, 1);
  frameRate(20);
}

void draw() {
  background(255);
  r1.display();
  println("cls");
  println(controls);
  println(r1.getAltitude());
}

void keyPressed() {
  for (int i = 0; i < controls.length; i++) {
    if (keyCode == 37+i) {
      controls[i] = true;
    }
  }
  if (key == ' ') {
    r1.resetPos();
  }
  if (key == 'p' || key == 'P') {
    pause = !pause;
  }
}
void keyReleased() {
  for (int i = 0; i < controls.length; i++) {
    if (keyCode == 37+i) {
      controls[i] = false;
    }
  }
}