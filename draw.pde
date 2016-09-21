void draw() {
  background(0);
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
  //image(img, 0, 0);
  //image(dots, 0, 0);
  render.beginDraw();
  render_final();
  render.endDraw();
  image(render, 0, 0);
}

void render_final() {
  render.background(0);
  render.loadPixels();
  for (int i = 0; i < render.pixels.length; i++) {
    int r = (dots.pixels[i] & 0xFF0000) / 0x00FFFF;
    int g = (dots.pixels[i] & 0x00FF00) / 0x0000FF;
    int b = (dots.pixels[i] & 0x0000FF);
    int a = (img.pixels[i] & 0x0000FF);
    color c = color(r, g, b, a);
    render.pixels[i] = c;
  }
  render.updatePixels();
}

int getHue(int red, int green, int blue) {
  float min = Math.min(Math.min(red, green), blue);
  float max = Math.max(Math.max(red, green), blue);

  float hue = 0f;
  if (max == red)
    hue = (green - blue) / (max - min);
  else if (max == green)
    hue = 2f + (blue - red) / (max - min);
  else
    hue = 4f + (red - green) / (max - min);

  hue = hue * 60;
  if (hue < 0) hue = hue + 360;

  return Math.round(hue);
}