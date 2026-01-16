let cam;
let angle = 0;

function setup() {
  createCanvas(640, 400, WEBGL);
  cam = createCamera();
  cam.setPosition(0, 0, 600); //positionnement de la caméra au départ
  noStroke();//pas de bordure
}

function draw() {
  background(0);
  orbitControl();//pour tourner à la souris autour de l'objet

  // Creation du fond avec des "étoiles"
  randomSeed(1);
  strokeWeight(2); //épaisseur des étoile
  for (let i = 0; i < 100; i++) {
    stroke(255, random(50, 200));//bordure +ou- intense
    point(random(-width, width),random(-height, height),random(-600,       600)); //taille est placement aléatoire des étoiles
    
  }

//lumière
  ambientLight(80); 
  directionalLight(255, 255, 255, 1, -1, 0);

//Appel fonction recursive pour les planètes
  rec(6, 120); //6 planètes avec pour taille de base 120 px

  //mouvement style orbite
  angle += 0.01;
}

//   FONCTION RÉCURSIVE

function rec(n, size) {
  // planète 
  push();
  fill(100, 150, 255);
  sphere(size);
  pop();

  if (n <= 1) 
    return ;
  let nbLunes = 6;
  let rayonOrbit = size * 2;
//création des lunes en orbites
  for (let i = 0; i < nbLunes; i++) {
    push();

    let a = angle + (TWO_PI / nbLunes) * i; //pour répartir lunes sur l'ellipse à équidistance les une des autres
    let x = cos(a) * rayonOrbit; //calcul des coordonnées
    let y = sin(a) * rayonOrbit;

    translate(x, 0, y); // on place les lunes

    fill(255, 200, 100);

    rec(n - 1, size * 0.4); // 0.4 était le plus pertinent esthétiquement parlant

    pop(); //mise à jour 
  }
}





