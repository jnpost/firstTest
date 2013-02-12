
public class WordConjunction extends Word {
  public WordConjunction(String _w, String _pos) {
    super(_w, _pos);
  }

  public void render(int x, int y) {
    textFont(font3,20);
     fill(colorRedCON, colorGreenCON, colorBlueCON , 255);

    text(word, x, y);
  }
}

