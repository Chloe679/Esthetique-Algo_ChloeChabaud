void setup(){
  size(640,400);
  background(250,250,250);
}

void draw(){
  int x=640-1;
  int y=400-1;
  int n=0; 
  int d=0;
  while (n<=y&&d<=100){
    //frameCout s'incrémente à chaque nv passage de la boucle darw
     int r = (100 + d*5 + frameCount/3) % 255; //chaque trait (num d) a une couleur(=(100 + d * 5) qui change(+frameCount) on % pr nbr "possible"
    int g = (50 + d*5+ frameCount/2) % 255;
    int b = (25 + d*5 + frameCount/4) % 255;
    stroke(r, g, b); 
    d=d+1;
    strokeWeight(d); //epaisseur
    n=n+d+1; //determination coordonnées des rectangles
    x=x-d-10;
    y=y-d-10;
    rect(x,y,n-x,n-y);}
}
