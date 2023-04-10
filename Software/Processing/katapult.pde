import processing.serial.*;

float y1 = 0;
float y2 = 0;
float rezolucija = 5.0;
float x_lasera1, y_lasera1, x_lasera2, y_lasera2;
float x_katapult;
float y_katapult;
float udaljenost_lasera1 = 15.0; // centimetara
float ugao_lasera1 = 15.0; // stepeni
float udaljenost_lasera2 = 30.0;
float ugao_lasera2 = 30.0;
float x2_lasera1, x2_lasera2, y2_lasera1, y2_lasera2 = 1900;
float domet = 1900;
float d, ugao;
float[] tacka;
PImage laser, katapult;
Serial myPort;
int korak = 0;

void setup(){
  size(1000,1000);
  //fullScreen();
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
  String inBuffer = myPort.readString();   
    if (inBuffer != null) {
      println(inBuffer);
    }
  background(255);
  image(katapult, x_katapult-25, y_katapult-25, 50, 50);
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

float ugao_natezanja(int d, int v, int h){
  float g = 9.81;
  float ugao = 1/2*(acos((g*d*d/v*v - h)/sqrt(h*h + d*d)) + atan(d/h));
  return ugao;
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
    y1 -= 0.9668;
    myPort.write("L1_Aq");
  }
  if(key == 'D' || key == 'd'){
    y1 += 0.9668;
    myPort.write("L1_Dq");
  }
  if(key == 'J' || key == 'j'){
    y2 -= 0.9668;
    myPort.write("L2_Jq");
  }
  if(key == 'L' || key == 'l'){
    y2 += 0.9668;
    myPort.write("L2_Lq");
  }
  if(key == 'C' || key == 'c'){
    String s = "";
    if(ugao < 0){
       korak = ugao_u_korake(abs(ugao), 9);
       s = "OL" + Integer.toString(korak) + "q";
    }
    else{
       korak = ugao_u_korake(ugao, 9);
       s = "OD" + Integer.toString(korak) + "q";
    }
    myPort.write(s);
   delay(2000);
   myPort.write("Nq");
  }
  if(key == 'G' || key == 'g'){
    myPort.write("Nq");
  }
  if(key == 'B' || key == 'b'){
    myPort.write("Bq");
  }
  if(key == 32){
    myPort.write("Iq");
  }
}
