class Lampe
{
  // Attribute
  boolean an;
  int helligkeit;
  float x;
  float y;
  
  // Konstruktor
  Lampe(float x_, float y_)
  {
    x = x_;
    y = y_;
    an = false;
    helligkeit = 100;
  }
  
  // Methoden
  void zeichnen()
  {
    strokeWeight(4);
    if (an)
    {
    fill(60,50,helligkeit);
    }
    else
    {
      fill(150);
    }
    circle(x,y,100);
  }
  
  void setAn(boolean wert)
  {
    an = wert;
  }
  
  void heller()
  {
    if (helligkeit <= 90)
    {
      helligkeit = helligkeit + 10;
    }
    else
    {
      helligkeit = 100;
    }
  }
  
  void dunkler()
  {
    if (helligkeit >= 50)
    {
      helligkeit = helligkeit - 10;
    }
    else
    {
      helligkeit = 40;
    }
  }
}
