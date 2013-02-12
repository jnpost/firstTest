
public class WordPreposition extends Word {
  public WordPreposition(String _w, String _pos) {
    super(_w, _pos);
  }

  public void render(int x, int y) {
    textFont(font5,16);
    fill(colorRedPRE, colorGreenPRE, colorBluePRE, 255);
    
    text(word, x, y);
  }
}

