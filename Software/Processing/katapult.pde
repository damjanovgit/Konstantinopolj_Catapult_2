import processing.serial.*;

float y1 = 0;
float y2 = 0;
float rezolucija = 5.0;
float x_lasera1, y_lasera1, x_lasera2, y_lasera2;
float x_katapult;
float y_katapult;
float udaljenost_lasera1 = 20.0; // centimetara
float ugao_lasera1 = 0.0; // stepeni
float udaljenost_lasera2 = 20.0;
float ugao_lasera2 = 0.0;
float x2_lasera1, x2_lasera2, y2_lasera1, y2_lasera2 = 1900;
float domet = 1900;
float d, ugao;
float[] tacka;
PImage laser, katapult;
Serial myPort;
int korak = 0;
boolean left_right = false;
String inBuffer = "0";

float udaljenost_tekst, nagib_kasike_tekst, koraci_kasike_tekst, nagib_katapulta_tekst, koraci_nagiba_tekst, ugao_zakretanja_tekst, koraci_zakretanja_tekst;

void setup(){
  //size(1000,1000);
  fullScreen();
  x_lasera1 = udaljenost_lasera1 * sin(radians(ugao_lasera1)) * rezolucija;
  x_lasera2 = udaljenost_lasera2 * sin(radians(ugao_lasera2)) * rezolucija;
  y_lasera1 = udaljenost_lasera1 * cos(radians(ugao_lasera1)) * rezolucija;
  y_lasera2 = udaljenost_lasera2 * cos(radians(ugao_lasera2)) * rezolucija;
  
  y_katapult = y_lasera1 + 100;
  if(x_lasera1 > x_lasera2)
    x_katapult = x_lasera1 + 100;
  else
    x_katapult = x_lasera2 + 100;
    
  x_lasera1 = x_katapult - x_lasera1;
  x_lasera2 = x_katapult - x_lasera2;
  y_lasera1 = y_katapult - y_lasera1;
  y_lasera2 = y_katapult + y_lasera2;
  
  
  laser = loadImage("laser.png");
  katapult = loadImage("katapult.png");
  
  
  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[2], 9600);
}

void draw(){
  background(255);
  image(katapult, x_katapult-25, y_katapult-25, 50, 50);
  textSize(15);
  if(y2_lasera1 > y2_lasera2 && ((x2_lasera1 - x_katapult > 0 && x2_lasera2 - x_katapult > 0)||(x2_lasera1 - x_katapult < 0 && x2_lasera2 - x_katapult < 0))){
    tacka = presjek((int)x_lasera1, (int)y_lasera1, (int)x2_lasera1, (int)y2_lasera1, (int)x_lasera2, (int)y_lasera2 , (int)x2_lasera2,(int)y2_lasera2);
    d = distance((int)x_katapult, (int)y_katapult, tacka[0], tacka[1]);
    ugao = ugao((int)x_katapult, (int)y_katapult, tacka[0], tacka[1]);
    stroke(0,0,0);
    fill(0, 0, 0);
    text("d = " + String.format(java.util.Locale.US,"%.2f", d) + " cm", (x_katapult+tacka[0])/2, (y_katapult+tacka[1])/2);
    text("angle = " + String.format(java.util.Locale.US,"%.2f", ugao), x_katapult+50, y_katapult);
    line(x_katapult, y_katapult, tacka[0], tacka[1]);
  }
  
  stroke(0,0,0);
  fill(0, 0, 0);
  text(udaljenost_lasera1 + " cm", (x_katapult+x_lasera1)/2, (y_katapult+y_lasera1)/2);
  line(x_lasera1, y_lasera1, x_katapult, y_katapult);
  fill(0, 0, 0);
  text(udaljenost_lasera2 + " cm", (x_katapult+x_lasera2)/2, (y_katapult+y_lasera2)/2);
  line(x_lasera2, y_lasera2, x_katapult, y_katapult);
  
  textSize(50);
  text("Udaljenost: " + String.format(java.util.Locale.US,"%.2f", udaljenost_tekst) + " cm", width/2 - 300, height/2);
  text("Nagib kasike u stepenima: " + String.format(java.util.Locale.US,"%.2f", nagib_kasike_tekst), width/2 - 300, height/2 + 50);
  text("Nagib kasike u polukoracima: " + String.format(java.util.Locale.US,"%.2f", koraci_kasike_tekst), width/2 - 300, height/2 + 100);
  text("Nagib katapulta u stepenima: " + String.format(java.util.Locale.US,"%.2f", nagib_katapulta_tekst), width/2 - 300, height/2 + 150);
  text("Nagib katapulta u polukoracima: " + String.format(java.util.Locale.US,"%.2f", koraci_nagiba_tekst), width/2 - 300, height/2 + 200);
  text("Zakretanje katapulta u stepenima: " + String.format(java.util.Locale.US,"%.2f", ugao_zakretanja_tekst), width/2 - 300, height/2 + 250);
  text("Zakretanje katapulta u polukoracima: " + String.format(java.util.Locale.US,"%.2f", koraci_zakretanja_tekst), width/2 - 300, height/2 + 300);
  
  stroke(255,0,0);
  pushMatrix();
    translate(x_lasera1, y_lasera1);
    rotate(radians(y1));
    line(0, 0, 1900, 0);
    x2_lasera1=1900*cos(radians(y1)) + x_lasera1;
    y2_lasera1=1900*sin(radians(y1)) + y_lasera1;
  popMatrix();
  image(laser, x_lasera1-25, y_lasera1-25, 50, 50);
  pushMatrix();
    translate(x_lasera2, y_lasera2);
    rotate(radians(y2));
    line(0, 0, 1900, 0);
    x2_lasera2=1900*cos(radians(y2)) + x_lasera2;
    y2_lasera2=1900*sin(radians(y2)) + y_lasera2;
  popMatrix();
  image(laser, x_lasera2-25, y_lasera2-25, 50, 50);
}

float[] presjek(int x1_1, int y1_1, int x1_2, int y1_2, int x2_1, int y2_1, int x2_2, int y2_2){
  float tacka[] = {0.0, 0.0};
  float m1 = (float)(y1_2 - y1_1)/(float)(x1_2 - x1_1);
  float m2 = (float)(y2_2 - y2_1)/(float)(x2_2 - x2_1);
  float x = (m2*x2_1 - m1*x1_1 + y1_1 - y2_1)/(m2-m1);
  float y = m1*(x-x1_1) + y1_1;
  tacka[0] = x;
  tacka[1] = y;
  return tacka;
}

float ugao_natezanja(float d){
  if(d < 108)
    return (d - 83)/1.26;
  else if(d < 140)
    return (d - 104)/1.6;
  else if(d < 166)
    return (d - 140)/1.185;
  else if(d < 216)
    return (d - 166)/2.525;
  else if(d < 281)
    return (d - 216)/3.28;
  return 0.0;
}

int ugao_u_korake(float ugao, int odnos){
  int korak = (int)((4096*ugao)/360) * odnos;
  return korak;
}

float distance(int x_cat, int y_cat, float x_tac, float y_tac){
  float d = sqrt((float)pow(x_tac - x_cat, 2) + (float)pow(y_tac - y_cat, 2));
  return d/rezolucija;
}

float ugao(int x_cat, int y_cat, float x_tac, float y_tac){
  return degrees(atan((y_tac-y_cat)/(x_tac-x_cat)));
}

void keyPressed(){
  if(key == 'A' || key == 'a'){
    y1 -= 1.2;
    myPort.write("Aq");
  }
  if(key == 'D' || key == 'd'){
    y1 += 1.2;
    myPort.write("Dq");
  }
  if(key == 'J' || key == 'j'){
    y2 -= 1.2;
    myPort.write("Jq");
  }
  if(key == 'L' || key == 'l'){
    y2 += 1.2;
    myPort.write("Lq");
  }
  if(key == 'C' || key == 'c'){
    udaljenost_tekst = d;
    if(udaljenost_tekst < 108)
      nagib_kasike_tekst = 40.0;
    else if(udaljenost_tekst < 140)
      nagib_kasike_tekst = 50.0;
    else if(udaljenost_tekst < 166)
      nagib_kasike_tekst = 67.5;
    else if(udaljenost_tekst < 216)
      nagib_kasike_tekst = 80.0;
    else
      nagib_kasike_tekst = 104.0;
    koraci_kasike_tekst = ugao_u_korake(nagib_kasike_tekst, 5);
    nagib_katapulta_tekst = ugao_natezanja(udaljenost_tekst);
    koraci_nagiba_tekst = ugao_u_korake(nagib_katapulta_tekst, 5);
    ugao_zakretanja_tekst = ugao;
    koraci_zakretanja_tekst = ugao_u_korake(abs(ugao_zakretanja_tekst), 10);
    
    String s = "";
    if(ugao < 0){
       korak = ugao_u_korake(abs(ugao), 10);
       s = "OL" + Integer.toString(korak) + "q";
       left_right = false;
    }
    else{
       korak = ugao_u_korake(ugao, 10);
       s = "OD" + Integer.toString(korak) + "q";
       left_right = true;
    }
    myPort.write(s);
    while(!("1".equals(inBuffer))){
       inBuffer = myPort.readString();
       delay(1);
    }
    if(d < 108)
      myPort.write("N1q");
    else if(d < 140)
      myPort.write("N2q");
    else if(d < 166)
      myPort.write("N3q");
    else if(d < 216)
      myPort.write("N4q");
    else
      myPort.write("N5q");
    inBuffer = "0";
    while(!("1".equals(inBuffer))){
       inBuffer = myPort.readString();
       delay(1);
    }
    inBuffer = "0";
    float a = ugao_natezanja(d);
    s = "KA" + Integer.toString(ugao_u_korake(a, 5)) + "q";
    myPort.write(s);
  }
  if(key == 'S' || key == 's'){
    y1 = 0;
    y2 = 0;
  }
  if(key == 32){
    myPort.write("Iq");
    delay(5000);
    String s = "";
    if(left_right){
      s = "OL" + Integer.toString(korak) + "q";
    }else{
      s = "OD" + Integer.toString(korak) + "q";
    }
    myPort.write(s);
    while(!("1".equals(inBuffer))){
       inBuffer = myPort.readString();
       delay(1);
    }
    inBuffer = "0";
    myPort.write("Cq");
  }
}
