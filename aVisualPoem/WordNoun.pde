
public class WordNoun extends Word {
  public WordNoun(String _w, String _pos) {
    super(_w, _pos);
  }

  public void render(int x, int y) {
    textFont(font4, 25);
    fill(colorRedNO, colorGreenNO, colorBlueNO, 255);

    text(word, x, y);
  }
}

