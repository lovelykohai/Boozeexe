void setup()
{
  size(1000, 600);
  img = loadImage("pint.png");
}
PImage img;
int x=600;
int y=1;
int d = day();
int m = month();
int yr = year();
int yr2; //keep track of current day code
int ans;
String TextINeed;//five swans
String CityTavern; 
String Carrage;
String habita;
String DayOfWeek[]={"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
int beer;
int at; //five swans
int at1; //City Tavern
int at2; //the carrage
int at3; //habita
void draw()
{
  background(255, 255, 255);
  beer();
  x=x+1;
  if (x>1900)
  {
    x=600;
  }  
  if (y==1)
  {
    String lines[] = loadStrings("five swans newcastle - Google Search.html");
    String Tavern[] = loadStrings("city tavern newcastle - Google Search.html");
    String TheCarrage[]=loadStrings("the carriage newcastle - Google Search.html");
    String habs[]=loadStrings("habita bar newcastle - Google Search.html");
    habita = habs[217];
    CityTavern = Tavern[271];
    TextINeed = lines[239];
    Carrage = TheCarrage[232];
  }
  y=y+1;
  FindDay();
  DayCalc();
}

void beer()
{
  int x6=x;
  if (x>1000)
  {
    x6=x-1300;
  }
  beer=at;
  beerbase(x6);
  textSize(25);
  fill(0, 0, 0);
  text("The Five Swans", x6+10, 500);
  x6=x+300;
  if (x>700)
  {
    x6=x-1000;
  }
  beer=at1;
  beerbase(x6);
  textSize(25);
  fill(0, 0, 0);
  text("City Tavern", x6+10, 500);
  x6=x-300;
  if (x>1300)
  {
    x6=x-1600;
  }
  beer=at2;
  beerbase(x6);
  textSize(25);
  fill(0, 0, 0);
  text("The Carriage", x6+10, 500);
  x6=x-600;
  if (x>1600)
  {
    x6=x-1900;
  }
  beer=at3;
  beerbase(x6);
  textSize(25);
  fill(0, 0, 0);
  text("      Habita", x6+10, 500);
  x6=x6-1900;
  if (x>700)
  {
    x6=x-1900;
  }
}

void beerbase(int x9)
{
  //line(x9, 150, x9, 450);
  //fill(230, 165, 27);
  //line((x9+200), 150, (x9+200), 450);
  //line(x9, (450-(beer*3)), x9+200, (450-(beer*3)));
  int x1 = 0;
  fill(230, 165, 27);
  rect(x9, 449, 199, -((beer*3))+1);
  while (x1<11)
  {
    line(x9, (450-x1*30), (x9+50), (450-x1*30));
    fill(0, 0, 0);
    textSize(10);

    text(x1*10, x9+60, (450-x1*30));
    x1=x1+1;
  }
  image(img, x9, 151);
}

void FindDay()
{
  //Key Value Meathod

  yr2=yr-2000;
  yr2=yr2/4;
  yr2=yr2+d;
  int month[]={1, 4, 4, 0, 2, 5, 0, 3, 6, 1, 4, 6};
  yr2=yr2+month[m];
  if ((m==1||m==2)&&((yr)==2020))
  {
    yr2=yr2-1;
  }
  yr2=yr2+6;
  yr2=yr2+10;
  ans = yr2 % 7;
  ans=ans-1;
}

void DayCalc()
{
  //try to find what hour interval google logs the hour as
  //starts at 6AM
  int RN = hour();//set
  if (RN>5&&RN<24)
  {
    ans = 24*(ans-1)+RN;
  }
  if (RN<5)
  {
    ans = 6;
  }
  String t1 = ("["+str(ans));
  int p1=TextINeed.indexOf(t1, 1);
  int p2=CityTavern.indexOf(t1, 1);
  int p3=Carrage.indexOf(t1, 1);
  int p4=habita.indexOf(t1, 1);
  if (ans>9&&ans<100)
  {
    String h = TextINeed.substring(p1+4, (p1+6));
    boolean c = check(h);
    at = bh(c, h);
    String h1 = CityTavern.substring(p2+4, (p2+6));
    c = check(h1);
    at1 = bh(c, h1);
    String h2 = Carrage.substring(p3+4, (p3+6));
    c = check(h2);
    at2 = bh(c, h2);
    String h3 = habita.substring(p4+4, p4+6);
    c=check(h3);
    at3 = bh(c, h3);
  }
  if (ans<10)
  {
    String h = TextINeed.substring(p1+3, (p1+5));
    boolean c = check(h);
    at = bh(c, h);
    String h1 = CityTavern.substring(p2+3, (p2+5));
    c = check(h1);
    at1 = bh(c, h1);
    String h2 = Carrage.substring(p3+3, (p3+5));
    c = check(h2);
    at2 = bh(c, h2);
    String h3 = habita.substring(p4+3, p4+5);
    c=check(h3);
    at3= bh(c, h3);
  }
  if (ans>99)
  {
    String h = TextINeed.substring(p1+5, (p1+7));
    boolean c = check(h);
    at=bh(c, h);
    String h1 = CityTavern.substring(p2+5, (p2+7));
    c = check(h1);
    at1=bh(c, h1);
    String h2 = Carrage.substring(p3+5, (p3+7));
    c = check(h2);
    at2=bh(c, h2);
    String h3 = habita.substring(p4+5, p4+7);
    c=check(h3);
    at3=bh(c, h3);
  }
}
boolean check(String b)
{
  boolean c = true;
  if (b.contains("[")==false)
  {
    c = b.contains(",");
    return c;
  }
  return c;
}

Integer bh(boolean a, String h3)
{
  int v = 0;
  if (a==false)
  {
    v = Integer.parseInt(h3);
    return v;
  }
  if (a==true)
  {
    v = 0;
    return v;
  }
  return v;
}