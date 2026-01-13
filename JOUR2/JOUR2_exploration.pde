int cellSize = 1;
int coltot, lignetot;
int[][] tab;
int nbr_vie = 0;
boolean enVie = true; // mode propage_vie de base

void setup() {
  size(640, 400);
  coltot = width / cellSize;  // nbr colonne total
  lignetot = height / cellSize;
  tab = new int[lignetot][coltot];
  noStroke();
  
tab[lignetot/2][coltot/2]=1;}

void draw() {
  background(0);

  if (enVie) {
    if (nbr_vie < 500) { //pour limiter le grossissement 
      propager_vie();
    } else {
      enVie = false; // on passe en mode mort
    }
  } else {
    if (nbr_vie > 1) {
      propager_mort();
    } else {
      enVie = true; // on repasse en mode vie
    }
  }

  // affichage
  for (int ligne = 1; ligne < lignetot - 1; ligne++) {
    for (int colonne = 1; colonne < coltot; colonne++) {
      if (tab[ligne][colonne] == 1) {
        fill(0, 0, 200 + 0.5 * nbr_vie); // 1=vivant 0=mort
        rect(colonne * cellSize, ligne * cellSize, cellSize, cellSize); //on trace les cellules en forme de rectangle
      }
    }
  }
}

// propagation vie  diffusion aux 8 voisins
void propager_vie() {
  int[][] nouveau = new int[lignetot][coltot]; // on utilise une autre grille pour voir le changement progressivement
  for (int ligne = 1; ligne < lignetot - 1; ligne++) {
    for (int colonne = 1; colonne < coltot - 1; colonne++) { //les 8 voisins deviennent "vie" 
      if (tab[ligne][colonne] == 1) {
        nouveau[ligne][colonne+1] = 1;
        nouveau[ligne][colonne-1] = 1;
        nouveau[ligne+1] [colonne] = 1;
        nouveau[ligne-1][colonne] = 1;
        nouveau[ligne+1][colonne+1] = 1;
        nouveau[ligne+1][colonne-1] = 1;
        nouveau[ligne-1][colonne+1] = 1;
        nouveau[ligne-1][colonne-1] = 1;
      }
    }
  }
  tab = nouveau;
  nbr_vie += 8;
}

void propager_mort() {
  int[][] nouveau = new int[lignetot][coltot];// on utilise une autre grille pour voir le changement progressivement
  for (int ligne = 1; ligne < lignetot - 1; ligne++) {
    for (int colonne = 1; colonne < coltot - 1; colonne++) {
      if (tab[ligne][colonne] == 1) {
        boolean voisinsVivant = true; // la cellule reste vivante seulement si tous ces voisins sont vivants
        for (int dx = -1; dx <= 1; dx++) { //on va parcourir les voisins directs de la cellule en question (0,0)
          for (int dy = -1; dy <= 1; dy++) {
            if (dx != 0 || dy != 0) { //on ne se situe pas sûr la cellule elle-même
              if (tab[ligne + dy][colonne + dx] == 0) { // le voisin est dans l'état mort
                voisinsVivant = false; // 1 voisin est mort au moins
              }
            }
          }
        }
        if (voisinsVivant) { // 
          nouveau[ligne][colonne] = 1; // reste en vie 
        }
      }
    }
  }
  tab = nouveau;
  nbr_vie -= 8;
}
 
