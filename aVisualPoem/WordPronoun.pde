
public class WordPronoun extends Word {
  public WordPronoun(String _w, String _pos) {
    super(_w, _pos);
  }

  public void render(int x, int y) {
    textFont(font4,20);
    fill(colorRedPRO, colorGreenPRO, colorBluePRO, 255);

    text(word, x, y);
  }
}

