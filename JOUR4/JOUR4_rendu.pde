

String phrase = ""; // le mot rentrer que l'on veut "dessiner"
ArrayList<Wave> waves = new ArrayList<Wave>(); //liste des ondes qui doivent apparaitre

void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100); //mode couleur
  textSize(28);
}

void draw() {
  background(0, 0, 10);

  // afficher les ondes de petit à grand
  for (int i = waves.size()-1; i >= 0; i--) { //on parcourt l'ensemble des ondes à dessiner
    Wave w = waves.get(i); //wave[i] en gros
    w.update(); // fait apparaitre l'onde
    w.display(); //on l'a fait changer au cours du temps
    if (w.fin()) {// l'onde a disparue, on efface la lettre
      waves.remove(i); //on enleve l'onde de la liste
  }
  }

  // on affiche le texte tapé
  fill(255);
  text("Tapez votre texte : " + phrase, 20, height -40); // position du texte a rentrer
}

//fonction pr recupérer le mot
void keyTyped() {
  //on veut effacer une lettre
  if (key == BACKSPACE && phrase.length() > 0)
  { 
    phrase = phrase.substring(0, phrase.length() - 1); //on enlève la dernière lettre entrée
  } 
  else if (key == ENTER || key == RETURN) {
    // quand on valide le mot → on génère les ondes
    Creer_onde(phrase);
    phrase = ""; //on vide pour recommencer si on veut après
  } else {
    phrase += key;
  }
}

void Creer_onde(String phrase) {
//on parcourt chaque lettre en ignorant espace et caractère spéciaux
  for (int i = 0; i < phrase.length(); i++) {
    float x = width/2+i*5; //on met la position dasn la boucle pour que deux mêmes lettres n'aient pas des ellipses superposées
  float y = height/2+i*5;
    char c = phrase.charAt(i);
    c = Character.toLowerCase(c); //en minuscule si besoin
    if (c == ' ' || c == '#' || c == '\''|| c == ','|| c == '.'|| c == '!'|| c == '?' ) {
    continue;
}



    float couleur = map(c, 'a', 'z', 0, 360); //map transfo en nbr
    float vitesse = map(c, 'a', 'z', 0.5, 3);
    float epaisseur = map(c, 'a', 'z', 1, 6);
    float saturation = map(c, 'a', 'z', 20,100);
    float luminosite = map(c, 'a', 'z', 40, 100);
    float transparence = map(c, 'a', 'z', 150, 255);
    float ondulation = map(c, 'a', 'z', 0, 30);
    float perlinForce = map(c, 'a', 'z', 5, 40);

    


  waves.add(new Wave(
      x, y,
      couleur, vitesse, epaisseur,
      saturation, luminosite, transparence,
      ondulation, perlinForce
    ));
  }
}//on ajoute une onde dans la liste

boolean Voyelle (char c){
  if (c=='a'||c=='e'||c=='i'||c=='o'||c=='u'||c=='y'){
    return true;}
  else{
    return false;}
}

class Wave {

  float x, y;
  float angle = 0;
  float couleur;
  float vitesse;
  float epaisseur;
  float saturation;
  float luminosite;
  float transparence;
  float ondulation;
  float perlinForce;

  float radius = 5;   // taille de départ
  float alpha = 255;  // transparence de départ

  Wave(float x, float y,
       float couleur, float vitesse, float epaisseur,
       float saturation, float luminosite, float transparence,
       float ondulation, float perlinForce) {

         //  on stocke les paramètre visuels

    this.x = x;
    this.y = y;
    this.couleur = couleur;
    this.vitesse = vitesse;
    this.epaisseur = epaisseur;
    this.saturation = saturation;
    this.luminosite = luminosite;
    this.transparence = transparence;
    this.ondulation = ondulation;
    this.perlinForce = perlinForce;
  }

void update() {
  angle += 0.02;
  radius += vitesse;

  luminosite -= 0.01;     // baisse très lente
  transparence -= 0.2;    // reste visible longtemps
}

  void display() { //paramètre generaux de l'onde tt le long
    noFill();

    // couleur du contour de l'ellipse
  stroke(couleur, saturation, luminosite, transparence);
  strokeWeight(epaisseur);

  float dx = sin(angle * 3) * ondulation;
  float dy = cos(angle * 3) * ondulation;

    // dessin de l’onde
  ellipse(x + dx, y + dy, radius*2, radius*2);
}



boolean fin() {
  return transparence <= 0;// si l’onde est invisible → fin

}
}
