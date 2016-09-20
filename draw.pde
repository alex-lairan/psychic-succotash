void draw() {
  shift_mouse();
  float velocity = mouse_velocity();
  speed_movement += velocity;
  for(Smoke smk : smokes) {
    smk.run();
    smk.draw();
  }
  speed_movement -= velocity;
}