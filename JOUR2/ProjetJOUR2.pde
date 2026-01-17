int cellSize = 20;
int coltot, lignetot; //nbr de colonnes et de lignes au total
int[][] tab;

void setup() {
  size(640, 400);
  coltot = width / cellSize; //calcul nbr total de colonnes
  lignetot = height / cellSize; //idem ligne

  tab = new int[lignetot][coltot]; // creéation de la grille
  noStroke();

  // on place des plateformes initiales de manière aléatoires
  for (int i = 0; i < 5; i++) {
    int x = int(random(coltot));
    int y = int(random(lignetot))+1; //=1 pour ne jamais avoir 
    tab[y][x] = 1;
    
  }
  //pour le sol
  for (int c=0; c<=coltot-2;c++){
    tab[lignetot-1][c]=1;}

  // on étend les plateformes
  for (int y = 1; y < lignetot - 1; y++) {
    for (int x = 1; x < coltot - 1; x++) {
      if (tab[y][x] == 1) {
        tab[y][x+1] = int(random(2)); //renvoie 0 ou 1 (on étend ou pas) //
        tab[y][x-1] = int(random(2));
        tab[y+1][x] = int(random(2));
        tab[y-1][x] = int(random(2));
        tab[y+1][x+1] = int(random(2));
        tab[y+1][x-1] = int(random(2));
        tab[y-1][x+1] = int(random(2));
        tab[y-1][x-1] = int(random(2));
      }
    }
  }
}

void draw() {
  background(0);

  // source d'eau qui tombe d'en haut sur 6 pixels
  for (int x = coltot/2 - 3; x < coltot/2 + 3; x++) {
    tab[0][x] = 2;
  }

  ecoulement();

  // affichage 
  for (int y = 0; y < lignetot-1; y++) {
    for (int x = 0; x < coltot-1; x++) {
      if (tab[y][x] == 1) {
        fill(200);}      // plateforme
      else if (tab[y][x] == 2) 
      fill(0,150,255); // eau
      else continue;

      rect(x * cellSize, y * cellSize, cellSize, cellSize);
    }
  }
}

void ecoulement() {
  int[][] newTab = new int[lignetot][coltot]; // on cree une autre grille pour voir l'écoulement progressivement

  // on copie les plateformes ds la nouvelle grille
  for (int y = 0; y < lignetot-1; y++) {
    for (int x = 0; x < coltot-1; x++) {
      if (tab[y][x] == 1) newTab[y][x] = 1;
    }
  }

  //écouelement de l'eau   (parcourt de bas en haut)
  for (int y = lignetot - 2; y >= 0; y--) {
    for (int x = 0; x < coltot-1; x++) {

      if (tab[y][x] == 2) {

        // tombe en dessous
        if (y+1 < (lignetot-1) && tab[y+1][x] == 0) {
          newTab[y+1][x] = 2;
        }

        // glisse à droite OU à gauche (choix alétoire)
        else {
          int choix = random(1) < 0.5 ? -1 : 1; // renvoir 1 ou -1 //utilisation de chat GPT pour avoir une condition plus concise 
          int direction = x + choix;

          if (direction >= 0 && direction < coltot && tab[y][direction] == 0) { //pas hors case et que la case est bien vide
            newTab[y][direction] = 2;
          } else {
            newTab[y][x] = 2; // reste en place
          }
        }
      }
    }
  }

  tab = newTab; // on recopie la grille à chaque passage dans la boucle pour avoir l'écoulement progressif
}