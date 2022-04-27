import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

class HueLampe
{
  String bridgeIP = "HueITG";    // Adresse der HueBridge im Schulnetzwerk
  String username = "h4cAFIYkKux0Y3R0Nw8TlhXR5sg4DHHmkNDWvmWZ";  //Name eines in der Hue-Bridge registrierten Users
  int nummer = 1;
  String adresse = "http://"+bridgeIP+"/api/"+username + "/lights/" + nummer;  // Adresse der Lampe

  // Methoden der HUE
  /*
     * Gibt alle Informationen über die Lampe auf der Konsole aus
   */
  public HueLampe()
  {
    infosAusgeben();
  }

  void infosAusgeben()
  {
    get(adresse);
  }

  /*
     * Schaltet die Lampe an oder aus
   */
  void setAn(boolean wert)
  {
    String nachricht = "{\"on\":" + wert + "}";
    put(adresse + "/state", nachricht);
  }

  /*
     * Setzt den Farbwert der Lampe
   * Werte zwischen 0 und 65535
   */
  void setHue(int wert)
  {
    int hue = (int) (wert*65535/360);
    String nachricht = "{\"hue\":"+hue+"}";
    put(adresse + "/state", nachricht);
  } 

  /*
     * Setzt die Helligkeit der Lampe
   * Werte zwischen 1 und 254
   */
  void setHelligkeit(int wert)
  {
    int bri = (int)(wert * 255 / 100);
    if ((wert > 0 )&&(wert < 255))
    {
      String nachricht = "{\"bri\":"+ bri+"}";
      put(adresse + "/state", nachricht);
    }
  }

  /*
     * Verändert den Wert der Helligkeit der Lampe
   * Erlaubte Wertee zwischen -254 und 254
   */
  void setBriInc(int wert)
  {
    if ((wert > -255 )&&(wert < 255))
    {
      String nachricht = "{\"bri_inc\":"+wert+"}";
      put(adresse + "/state", nachricht);
    }
  }

  /*
     * Setzt die Sättigung der Lampe 
   * Werte zwischen 0 und 100
   */
  void setSat(int wert)
  {
    int sat = (int)(wert * 255 / 100);
    if ((wert > 0 )&&(wert < 255))
    {
      String adresse = "http://"+bridgeIP+"/api/"+username+"/lights/1/state";
      String nachricht = "{\"sat\":"+sat+"}";
      put(adresse, nachricht);
    }
  }

  void setNummer(int wert)
  {
    nummer = wert;
    adresse = "http://"+bridgeIP+"/api/"+username + "/lights/" + nummer;
  }


  /*
     * Mit dieser Methode kann man den Zustand der Lampe setzen
   */

  private String put(String adresse, String nachricht) {  
    String erg = "";
    try {
      URL url = new URL(adresse);  

      HttpURLConnection con = (HttpURLConnection) url.openConnection();
      con.setRequestMethod("PUT");
      con.setDoOutput(true);
      OutputStreamWriter out = new OutputStreamWriter(
        con.getOutputStream());
      out.write(nachricht);
      out.close();

      String readStream = readStream(con.getInputStream());
      // Give output for the command line
      System.out.println(readStream);
      erg = readStream;
    } 
    catch (Exception e) {
      e.printStackTrace();
    }
    return erg;
  }





  /*
     * Mit dieser Methode kann man Information von der Lampe bekommen
   */
  private String get(String adresse) {  
    String erg = null;
    try {
      URL url = new URL(adresse);                      
      HttpURLConnection con = (HttpURLConnection) url.openConnection();
      String readStream = readStream(con.getInputStream());
      // Give output for the command line
      System.out.println(readStream);
      erg = readStream;
    } 
    catch (Exception e) {
      e.printStackTrace();
    }
    return erg;
  }

  private String readStream(InputStream in) {
    StringBuilder sb = new StringBuilder();
    BufferedReader reader = new BufferedReader(new InputStreamReader(in));
    try{
      String nextLine = "";
      while ((nextLine = reader.readLine()) != null) {
        sb.append(nextLine);
      }
      reader.close();
      
    } 
    catch (IOException e) {
      e.printStackTrace();
    }
    return sb.toString();
  }
}
