int NUM_FLAKES = 100;
Snowflake[] flakes = new Snowflake[NUM_FLAKES];

void setup()
{
  //your code here
  size(300, 300);
  for (int i = 0; i < flakes.length; i++)
  {
    flakes[i] = new Snowflake();
  }
}
void draw()
{
  //your code here
  background(0);
  for (int i = 0; i < flakes.length; i++)
  {
    flakes[i].erase();
    flakes[i].lookDown();
    flakes[i].move();
    flakes[i].wrap();
    flakes[i].show();
  }
}
void mouseDragged()
{
  //your code here
  
}

class Snowflake
{
  //class member variable declarations
  int snowX, snowY;
  boolean isMoving;
  Snowflake()
  {
    //class member variable initializations
    snowX = (int)(Math.random()*301);
    snowY = (int)(Math.random()*301);
    isMoving = true;
  }
  void show()
  {
    //your code here
    fill(255);
    ellipse(snowX, snowY, 5, 5);
  }
  void lookDown()
  {
    //your code here
    if ((snowY > 0 && snowY < 300) && (get(snowX, snowY-1)) != color(0))
      isMoving = false;
    else
      isMoving = true;
  }
  void erase()
  {
    //your code here
    fill(0);
    ellipse(snowX, snowY, 7, 7);
  }
  void move()
  {
    //your code here
    if (isMoving == true)
      snowY++;
  }
  void wrap()
  {
    //your code here
    if (snowY > 300)
    {
        snowY = 0;
        snowX = (int)(Math.random()*301);
    }
  }
}


