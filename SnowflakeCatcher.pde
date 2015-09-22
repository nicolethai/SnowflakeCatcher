void setup()
{
  //your code here
  size(300, 300);
}
void draw()
{
  //your code here
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
    ismoving = true;
  }
  void show()
  {
    //your code here
  }
  void lookDown()
  {
    //your code here
    if ((snowY > 0 && snowy < 300) && (get(snowX, snowY-1) != color(0))
      isMoving = false;
    else
      isMoving = true;
  }
  void erase()
  {
    //your code here
    fill(0);
    ellipse(snowX, snowY, 7);
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
  }
}


