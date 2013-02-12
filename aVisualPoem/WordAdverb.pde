
public class WordAdverb extends Word {
  public WordAdverb(String _w, String _pos) {
    super(_w, _pos);
  }

  public void render(int x, int y) {
    textFont(font2,40);
    fill(colorRedAD, colorGreenAD, colorBlueAD, 255);

    text(word, x, y);
  }
}

