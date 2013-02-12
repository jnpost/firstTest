
public class WordVerb extends Word {
  public WordVerb(String _w, String _pos) {
    super(_w, _pos);
  }

  public void render(int x, int y) {
    textFont(font7,32);
     fill(colorRedV, colorGreenV, colorBlueV, 255);

    text(word, x, y);
  }
}

