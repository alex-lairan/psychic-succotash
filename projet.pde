import java.util.LinkedList;

PGraphics dots, render;
PImage img;

LinkedList<Smoke> smokes = new LinkedList();
float speed_movement = 50;
final int SMOKE_COUNT = 2 * 2 * 2 * 2 * 2 * 2 * 2 * 2 * 2;

void setup() {
  fullScreen();
  noStroke();

  background(0);
  frameRate(120);
  init_mouse();
  
  dots    = createGraphics(width, height);
  render  = createGraphics(width, height);
  img     = loadImage("reference/city.jpg");

  for(int i = 0; i < SMOKE_COUNT; ++i) {
    smokes.add(new Smoke((int)random(width), (int)random(height))); 
  }
}