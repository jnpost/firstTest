
import java.util.*;

List<Word> words;

PFont font = createFont("Arial", 16);
PFont font2 = createFont("copperplate", 35); 
PFont font3 = createFont("cracked", 20);
PFont font4 = createFont("portagoitc tt", 25);
PFont font5 = createFont("chalkduster", 16);
PFont font6 = createFont("ocr a std", 20);
PFont font7 = createFont("marker felt", 32);
PFont font8 = createFont("playbill", 29);




float colorBlue;
float colorGreen;
float colorRed;

float colorBlueAD;
float colorGreenAD;
float colorRedAD;

float colorBlueCON;
float colorGreenCON;
float colorRedCON;

float colorBlueNO;
float colorGreenNO;
float colorRedNO;

float colorBluePRE;
float colorGreenPRE;
float colorRedPRE;

float colorBluePRO;
float colorGreenPRO;
float colorRedPRO;

float colorBlueV;
float colorGreenV;
float colorRedV;

float counter;

float randC;

ParticleSystem ps;


void setup() {
  size(700,700);  
  Map<String, List<String>> wordMap = loadInWords("words.txt"); 
  for (String k : wordMap.keySet()) {
    List<String> values = wordMap.get(k);
    for (String v : values) {
     ps = new ParticleSystem(new PVector(width/2,50));
    }   
  }
  
  
  words = parseGrammar(wordMap, "grammar.txt");
}

Map<String, List<String>> loadInWords(String filename) {
  Map<String, List<String>> m = new HashMap<String, List<String>>();
  String[] lines = loadStrings(filename);
  for (int i = 0 ; i < lines.length; i++) {
    String[] chop = split(lines[i], ':');
    String POS = chop[0];
    String wordsStr = chop[1];
    String[] wordsArr = split(wordsStr, ','); //split right side into an array of Strings
    List<String> wordsList = Arrays.asList(wordsArr); //turns array into a List
    for (String tmpStr : wordsList) {
    }
    
    m.put(POS, wordsList);
  }
  
  return m;
}

List<Word> parseGrammar( Map<String, List<String>> m, String filename) {
  
  List<Word> ws = new ArrayList<Word>();
  // TO DO - 
  // 1. Load in Strings from "grammar.txt" and loop through each line.
  String[] lines = loadStrings(filename);
  for(String line : lines) {
    println(line); 
    String[] posArr = line.split(" ");
    List<String> posList = Arrays.asList(posArr); //turns array into a List
    for (String p : posList) {
      List<String> listOfWords = m.get(p);
      int randNum = (int) random(0,listOfWords.size());
      String randomWord = listOfWords.get( randNum );
      println("\t\t" + randomWord);
      
      Word w;
      if (p.equals("NOUN")) {
        w = new WordNoun(randomWord, p);}
      else if (p.equals("VERB")) {
        w = new WordVerb(randomWord, p);}
      else if (p.equals("ADJECTIVE")) {
        w = new WordAdjective(randomWord, p);}
      else if (p.equals("ADVERB")) {
        w = new WordAdverb(randomWord, p);}
      else if (p.equals("CONJUNCTION")) {
        w = new WordConjunction(randomWord, p);}
      else if (p.equals("PREPOSITION")) {
        w = new WordPreposition(randomWord, p);}
      else if (p.equals("PRONOUN")) {
        w = new WordPronoun(randomWord, p);}
      else {
        w = new Word(randomWord, p);
      }
      
      ws.add(w);
      
    }
  }
  return ws;
 }



void draw() {
   background(0,0,255); 
   ps.addParticle();
   ps.run();
   int pX = 50;
   int pY = 100;
   
   for (Word w : words) {
     if (pX + (int)textWidth(w.word) +30 > width){
       pX=30;
       pY+=60;
     }
     w.render(pX, pY);
     
     int sw = (int)textWidth(w.word);
     pX += sw + 30;
     
     if (pX > width) {
       pX = 30;
       pY += 60;
       
        
     }
   }
}
  class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void run() {
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove(); 
      }
    }
  }
}





class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  

  Particle(PVector l) {
    acceleration = new PVector(0,0.0025);
    velocity = new PVector(random(-.7,.7),random(-.5,0));
    location = l.get();
    lifespan = 255.0;
    
    colorBlue= 255.0;
    colorGreen= 0.0;
    colorRed= 0.0;
    
    colorBlueAD= 255.0;
    colorGreenAD= 0.0;
    colorRedAD= 0.0;
    
    colorBlueCON= 255.0;
    colorGreenCON= 0.0;
    colorRedCON= 0.0;
    
    colorBlueNO= 255.0;
    colorGreenNO= 0.0;
    colorRedNO= 0.0;
    
    colorBluePRO= 255.0;
    colorGreenPRO= 0.0;
    colorRedPRO= 0.0;
    
    colorBluePRE= 255.0;
    colorGreenPRE= 0.0;
    colorRedPRE= 0.0;
    
    colorBlueV= 255.0;
    colorGreenV= 0.0;
    colorRedV= 0.0;
    
    counter=0;
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= .05;
    
    float randC = (float) random(0,5);
   
    counter+=1;
   
    if (counter>750){
          colorBlue -= randC;
          colorGreen -= randC;
          colorRed -= randC;
          if (colorBlue<50.0){
           colorBlue=255.0;
          }else if (colorRed<70.0){
           colorRed=200.0;
          }else if (colorGreen<50.0){
           colorGreen=200.0;
          }else{
            return;
          }
    }else if (counter>700){
      colorBlueAD -= randC;
      colorRedAD -= randC;
      colorGreenAD -= randC;
      if (colorBlueAD<50.0){
       colorBlueAD=255.0;
      }else if (colorRedAD<50.0){
       colorRedAD=200.0;
      }else if (colorGreenAD<70.0){
       colorGreenAD=200.0;
      }else{
        return;
      }
    }else if (counter>650){
      colorBlueCON -= randC;
      colorRedCON -= randC;
      colorGreenCON -= randC;
      if (colorBlueCON<50.0){
       colorBlueCON=255.0;
      }else if (colorRedCON<70.0){
       colorRedCON=200.0;
      }else if (colorGreenCON<50.0){
       colorGreenCON=200.0;
      }else{
        return;
      }
    }else if (counter>600){
      colorBlueNO -= randC;
      colorRedNO -= randC;
      colorGreenNO -= randC;
      if (colorBlueNO<50.0){
       colorBlueNO=255.0;
      }else if (colorRedNO<50.0){
       colorRedNO=200.0;
      }else if (colorGreenNO<70.0){
       colorGreenNO=200.0;
      }else{
        return;
      }
    }else if (counter>550){
      colorBluePRE -= randC;
      colorRedPRE -= randC;
      colorGreenPRE -= randC;
      if (colorBluePRE<50.0){
       colorBluePRE=255.0;
      }else if (colorRedPRE<70.0){
       colorRedPRE=200.0;
      }else if (colorGreenPRE<70.0){
       colorGreenPRE=200.0;
      }else{
        return;
      }
    }else if (counter>500){
      colorBluePRO -= randC;
      colorRedPRO -= randC;
      colorGreenPRO -= randC;
      if (colorBluePRO<50.0){
       colorBluePRO=255.0;
      }else if (colorRedPRO<50.0){
       colorRedPRO=200.0;
      }else if (colorGreenPRO<50.0){
       colorGreenPRO=200.0;
      }else{
        return;
      }
    }else if (counter>450){
      colorBlueV -= randC;
      colorRedV -= randC;
      colorGreenV -= randC;
      if (colorBlueV<50.0){
       colorBlueV=255.0;
      }else if (colorRedV<70.0){
       colorRedV=200.0;
      }else if (colorGreenV<50.0){
       colorGreenV=200.0;
      }else{
        return;
      }
    }else{
      return;
    }
    
    
  }




  void display() {
    stroke(255,lifespan);
    fill(255,lifespan);
    ellipse(location.x,location.y,100,50);
  }
  
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
