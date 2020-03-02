class Fernbedienung
{
  // Attribute
  float x;
  float y;
  Button b1;
  Button b2;
  Button b3;
  Button b4;
  
  // Referenzattribute
  Lampe lampe;
  HueLampe hueLampe;

  // Konstruktor
  Fernbedienung(float x_, float y_, Lampe l_, HueLampe h_)
  {
    x = x_;
    y = y_;
    b1 = new Button(x, y, "I",this);
    b2 = new Button(x, y + 60, "O", this);
    b3 = new Button(x, y + 120, "+", this);
    b4 = new Button(x, y + 180, "-", this);
    lampe = l_; 
    hueLampe = h_;
  }
  // Methoden
  void zeichnen()
  {
    strokeWeight(1);
    fill(50,1,100);
    rect(x, y+90, 120, 260);
    b1.zeichnen();
    b2.zeichnen();
    b3.zeichnen();
    b4.zeichnen();
  }

  // Leitet das an alle Button weiter
  void mouseMoved()
  {
    b1.mouseMoved();
    b2.mouseMoved();
    b3.mouseMoved();
    b4.mouseMoved();
  }

  void mouseClicked()
  {
    b1.mouseClicked();
    b2.mouseClicked();
    b3.mouseClicked();
    b4.mouseClicked();
  }
  
 // Hier findet die Reaktion auf das Druecken der Button statt.
  void meldung(String s)
   {
     // Wenn die Meldung vom Button mit I kommt, wird die Lampe
     // eingeschaltet
     if (s.equals("I"))
     {
       lampe.setAn(true);
       hueLampe.setAn(true);
       
     }
     if (s.equals("O"))
     {
       lampe.setAn(false);
       hueLampe.setAn(false);
     }
     if (s.equals("+"))
     {
       lampe.heller();
     }
     if (s.equals("-"))
     {
       lampe.dunkler();
     }
     
     
   }
}
