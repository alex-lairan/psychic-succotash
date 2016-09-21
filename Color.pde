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
  
  public void setColor(PGraphics graphic) {
    graphic.fill(r, g, b); 
  }
}