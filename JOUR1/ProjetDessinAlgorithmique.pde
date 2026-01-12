int sizeIncrement = 0;

void setup() {
  size(400, 400);
  background(0);
}

void draw(){
  colorMode(HSB, 360, 100, 100);
  translate(width/2, height/2); // on se place au centre de la frame
  for(int j=0; j<=50;j++){
      int y=0; //coordonnée cercle sur l'axe vertical
      int tcercle=0; //taille cercle
      pushMatrix();
      rotate(j *2* PI/50); //rotation du plan
    for(int i=0; i<=50; i++){
       y+=20;
       tcercle=2+i+sizeIncrement; // cercle de + en + gros
       fill(frameCount*0,9,0,0);// retrace un cercle noir à l'interieur
       circle(0, y, tcercle);
       float couleur = (30 + i*2 + frameCount*2) % 360;
       stroke(couleur, 200, 50);
       circle(0, y, tcercle);
    }
     popMatrix();
  }
}

void mouseClicked() {
   sizeIncrement += 5; } // quand on clique, les cercles seront tracés plus gros
  