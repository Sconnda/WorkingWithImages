PImage ocean;
PImage fin;
float x, y, v;
PVector sz;

void setup() {
  size(500, 500);
  ocean = loadImage("Ocean.jpg");
  ocean.resize(width, height);
  fin = loadImage("Fin.png");
  y = random(height/2, height);
  x = 0;
  v = 3*y/height;
  sz = new PVector(fin.width, fin.height);
}

void draw() {
  background(ocean);
  fin.resize(round(y*sz.x/5/height), round(y*sz.y/5/height));
  translate(x, y);
  pushMatrix();
    scale(-abs(v)/v, 1);
    image(fin, 0, 0);
  popMatrix();
  x += v;
  if (x > width) {
    x = width;
    v /= y;
    y = random(height/2,height);
    v *= -y;
  } else if (x < 0) {
    x = 0;
    v /= y;
    y = random(height/2,height);
    v *= -y;
  }
}