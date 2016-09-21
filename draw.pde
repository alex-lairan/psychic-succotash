void draw() {
  shift_mouse();
  float velocity = mouse_velocity();
  speed_movement += velocity;
  
  dots.beginDraw();
  dots.noStroke();
  for(Smoke smk : smokes) {
    smk.run();
    smk.draw(dots);
  }
  dots.endDraw();
  speed_movement -= velocity;
  
  //System.out.println("Red: " + (dots.pixels[1] & 0xFF0000) / 0x00FFFF);
  //System.out.println("Green: " + (dots.pixels[1] & 0x00FF00) / 0x0000FF);
  //System.out.println("Blue: " + (dots.pixels[1] & 0x0000FF));
  //System.out.println("====================");
  image(img, 0, 0);
  image(dots, 0, 0);
}