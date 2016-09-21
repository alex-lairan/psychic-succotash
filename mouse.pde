Coordinate[] mouse_pos = new Coordinate[2];

void mousePressed() {
  dots.beginDraw();
  dots.background(0);
  dots.endDraw();
}

void init_mouse() {
  mouse_pos[0] = mouse_pos[1] = new Coordinate(mouseX, mouseY);
}

void shift_mouse() {
  mouse_pos[1] = mouse_pos[0];
  mouse_pos[0] = new Coordinate(mouseX, mouseY);
}

float mouse_velocity() {
  return sqrt(pow(mouse_pos[0].y - mouse_pos[1].y, 2) + pow(mouse_pos[0].x - mouse_pos[1].x, 2)) * 5; 
}