import java.util.LinkedList;

int num = 50;
int[] x = new int[num];
int[] y = new int[num];
LinkedList<Smoke> smokes = new LinkedList();

void setup() { 
  size(1000, 1000);
  noStroke();
  fill(255, 102);
  for(int i = 0; i < 200; ++i) {
    smokes.add(new Smoke((int)random(1000), (int)random(1000))); 
  }
  background(0);
}

void draw() {
  for(Smoke smk : smokes) {
    smk.run();
    smk.draw();
  }
}


class Coordinate {
  public int x;
  public int y;
  
  public Coordinate(int _x, int _y) {
    x = _x;
    y = _y;
  }
}

class Color {
  private int r, g, b; 
  
  public Color(int _r, int _g, int _b) {
    r = _r;
    g = _g;
    b = _b;
  }
  
  public void setColor() {
    fill(r, g, b); 
  }
}

class Smoke {
  private LinkedList<Coordinate> positions;
  private Color coloris;

  public Smoke(Coordinate position) {
    coloris = new Color((int)random(255), (int)random(255), (int)random(255));
    positions = new LinkedList();
    positions.add(position);
  }

  public Smoke(int x, int y) {
    this(new Coordinate(x, y));
  }
  
  public void run() {
    float new_one = random(100);
    Coordinate new_pos = new Coordinate(positions.get(0).x + (int)(random(25) - 12.5), 
                                        positions.get(0).y + (int)(random(25) - 12.5));
    
    positions.addFirst(new_pos);
    if(new_one < 90) {
      positions.pollLast(); 
    } else if(new_one < 92.5 && positions.size() > 15) {
      int rnd = (int)random(10);
      for(int i = 0; i < rnd; ++i) {
         positions.pollLast();
      }
    }
  }

  public void draw() {
    coloris.setColor();
    for(int i = 0; i < positions.size(); ++i) {
      ellipse(positions.get(i).x % 1000, this.positions.get(i).y % 1000, i / 5.0, i / 5.0); 
    }
  }
}