void setup(){
  size(640,400);
  background(250,250,250);
  int x=640-1;
  int y=400-1;
  int n=0; 
  int d=0;
  while (n<=y&&d<=100){
    d=d+1;
    strokeWeight(d); //epaisseur
    n=n+d+1; //determination coordonnées des rectangles
    x=x-d-10;
    y=y-d-10;
    rect(x,y,n-x,n-y);}
}

void draw(){
}
