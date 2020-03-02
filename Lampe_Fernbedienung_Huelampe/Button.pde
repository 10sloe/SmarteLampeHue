class Button
{
  // Attribute
  private float x;
  private float y;
  private float breite;
  private float hoehe;
  private float rundung;
  private String text;
  
  // Referenzattribute
  private Fernbedienung f;

  // gibt an, ob gerade die Maus ueber diesem Button steht
  private boolean mouseOver;

  // Konstruktor
  Button(float x_, float y_, String text_, Fernbedienung f_)
  {
    x = x_;
    y = y_;
    breite = 100;
    hoehe = 50;
    rundung = 10;
    text = text_;
    f = f_;
    mouseOver = false;
  }

  // Methoden
  public void zeichnen()
  {
    strokeWeight(1);
    
    // wenn gerade die Maus ueber diesem Button ist, wird er 
    // in einer anderen Farbe angezeigt
    if (mouseOver)
    {
      fill(167, 7, 70);
    } else
    {
      fill(167, 7, 90);
    }
    
    // Darstellung des Button mit einem Rechteck und Text
    rect(x, y, breite, hoehe, rundung);
    fill(10);
    textAlign(CENTER);
    text(text, x, y);
  }

  void mouseMoved()
  {
    // Wenn die Maus gerade ueber dem Button ist, wird die Variable mouseOver 
    // entsprechend gesetzt
    
    if (mouseX > x - breite/2 && mouseX < x + breite/2 && 
      mouseY > y - hoehe/2 && mouseY < y + hoehe/2)
    {
      mouseOver = true;
    } else
    {
      mouseOver = false;
    }
  }

 
  void mouseClicked()
  {
    // Wenn der Mausklick ueber diesem Button aufgefuehrt wurde, wird
    // die passende Meldung an das zugehörige Fernbedienungsobjekt geschickt.
    if (mouseOver)
    {
      f.meldung(text);
    }
  }
}
