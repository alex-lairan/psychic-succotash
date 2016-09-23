import java.util.LinkedList;

int coloration = 50;

class Smoke {
  private LinkedList<Coordinate> positions;
  private Color coloris;

  public Smoke(Coordinate position) {
    int a = img.pixels[position.x + position.y * img.width];
    int r = (a & 0xFF0000) / 0x00FFFF;
    int g = (a & 0x00FF00) / 0x0000FF;
    int b = (a & 0x0000FF);
    if((r == g && g == b) || ((r + g +b) / 3) < 15) {
      r = (int)random(255 - coloration) + coloration;
      g = (int)random(255 - coloration) + coloration;
      b = (int)random(255 - coloration) + coloration;
    }
    coloris = new Color(r, g ,b);
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
      float circle_size = 1.5;
      graphic.ellipse(positions.get(i).x % width, this.positions.get(i).y % height, i / circle_size, i / circle_size); 
    }
  }
}