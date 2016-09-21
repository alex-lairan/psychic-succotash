import java.util.LinkedList;

PGraphics dots, render;
PImage img;

LinkedList<Smoke> smokes = new LinkedList();
float speed_movement = 50;
final int SMOKE_COUNT = 200;

void setup() {
  // 900 × 370
  size(1920, 1080);
  noStroke();
  for(int i = 0; i < SMOKE_COUNT; ++i) {
    smokes.add(new Smoke((int)random(width), (int)random(height))); 
  }
  background(0);
  frameRate(60);
  init_mouse();
  
  dots    = createGraphics(width, height);
  render  = createGraphics(width, height);
  img     = loadImage("lion.jpg");
}