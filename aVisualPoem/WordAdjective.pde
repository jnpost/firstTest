
public class WordAdjective extends Word {
  public WordAdjective(String _w, String _pos) {
    super(_w, _pos);
  }

  public void render(int x, int y) {
    textFont(font8,29);
     fill(colorRed, colorGreen, colorBlue, 255);

    text(word, x, y);
  }
}

