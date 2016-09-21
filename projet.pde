import java.util.LinkedList;

PGraphics dots;
PImage img;

LinkedList<Smoke> smokes = new LinkedList();
float speed_movement = 50;
final int SMOKE_COUNT = 200;

void setup() {
  // 900 × 370
  size(900, 370);
  noStroke();
  for(int i = 0; i < SMOKE_COUNT; ++i) {
    smokes.add(new Smoke((int)random(width), (int)random(height))); 
  }
  background(0);
  frameRate(60);
  init_mouse();
  
  dots  = createGraphics(width, height);
  img = loadImage("mountain.jpeg");
}