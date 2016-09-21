import java.util.LinkedList;

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
    Coordinate new_pos = new Coordinate(positions.get(0).x + (int)(random(speed_movement) - speed_movement/2), 
                                        positions.get(0).y + (int)(random(speed_movement) - speed_movement/2));
    
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

  public void draw(PGraphics graphic) {
    coloris.setColor(graphic);
    for(int i = 0; i < positions.size(); ++i) {
      graphic.ellipse(positions.get(i).x % width, this.positions.get(i).y % height, i / 5.0, i / 5.0); 
    }
  }
}