Fernbedienung f;
Lampe lampe;
HueLampe huelampe;

void setup()
{
  colorMode(HSB, 360, 100, 100);
  size(500, 400);
  background(0,0,100);
  rectMode(CENTER);
  lampe = new Lampe(320, 200);
  huelampe = new HueLampe();
  f = new Fernbedienung(100, 110, lampe, huelampe);
}

void draw()
{
  f.zeichnen();
  lampe.zeichnen();
}

// wird immer aufgerufen, wenn die Maus bewegt wurde
void mouseMoved() {
  f.mouseMoved();
}

// wird immer aufgerufen, wenn die Maus geklickt wurde
void mouseClicked() {
  f.mouseClicked();
}
