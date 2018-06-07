

float xOffset = 100;      // Perlin x-offset
float yOffset = -100;    // Perlin y-offset
float offsetInc = 0.005;  // Perlin offset increment
float inc = 1;            // Perin increment
float s = 800;           // Size of perlin ring
float m = 0.99;          // Size multiplier
int nPoints = 1000;        // Resolution of perlin ring
int nSeed = 15;           // Perlin noise seed


void setup() {
  size(1920, 1055, P2D);
  //noLoop();
  colorMode(HSB, 360, 100, 100, 100);
  //pixelDensity(displayDensity());
  background(0, 0, 100);
  //blendMode(ADD);
  noFill();
  noiseSeed(nSeed);
  translate(width * 0.5, height * 0.5); //controls position

  // Create a series of perlin rings from big to small
  while (s > 0.5) {
    // Create ring
    beginShape();
    for (int i = 0; i < nPoints; i++) {
      PVector p = PVector.fromAngle(i / (float) nPoints * TAU);
      float n = noise(xOffset + p.x * inc, yOffset + p.y * inc) * s;
      p.mult(n);
      //float h = map(p.x, 0, width, 200, 300); //makes color based on location on screen
      stroke(0, 0, 0, 20);
      vertex(p.x, p.y);
    }
    endShape(CLOSE);

    // Increment perlin offset for next ring
    xOffset += offsetInc;
    yOffset += offsetInc;

    // Reduce size for next ring
    s *= m;
  }
}

void draw() {
}

void keyPressed() {
  save("supernova_014.tif");
  println("screenshot!");
}
