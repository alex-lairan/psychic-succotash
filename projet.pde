import java.util.LinkedList;

LinkedList<Smoke> smokes = new LinkedList();
float speed_movement = 50;

Coordinate[] mouse_pos = new Coordinate[2];

final int SMOKE_COUNT = 200;

void setup() {
  size(1000, 1000);
  noStroke();
  for(int i = 0; i < SMOKE_COUNT; ++i) {
    smokes.add(new Smoke((int)random(width), (int)random(height))); 
  }
  background(0);
  frameRate(60);
  init_mouse();
}