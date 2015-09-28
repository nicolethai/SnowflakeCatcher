// snowflakes array
public final static int NUM_FLAKES = 100;
Snowflake[] flakes = new Snowflake[NUM_FLAKES];

int WIDTH_HEIGHT = 500;

void setup()
{
  //your code here
  background(0);
  size(WIDTH_HEIGHT, WIDTH_HEIGHT);
  for (int i = 0; i < flakes.length; i++)
  {
    flakes[i] = new Snowflake();
  }
}
void draw()
{
  //your code here
  for (int i = 0; i < flakes.length; i++)
  {
    flakes[i].erase();
    flakes[i].lookDown();
    flakes[i].move();
    flakes[i].wrap();
    flakes[i].show();
  }
  //floor
  fill(255);
  rect(0, 500-10, 500, 10);
}
void mouseDragged()
{
  //your code here
  noStroke();
  fill(255, 255, 0);
  rect(mouseX, mouseY, 10, 10);
}

class Snowflake
{
  //class member variable declarations
  int snowX, snowY;
  boolean isMoving;
  Snowflake()
  {
    //class member variable initializations
    snowX = (int)(Math.random()*(WIDTH_HEIGHT+1));
    snowY = (int)(Math.random()*(WIDTH_HEIGHT+1)+1);
    isMoving = true;
  }
  void show()
  {
    //your code here
    // noFill();
    fill(255);
    stroke((int)(Math.random()*255));
    ellipse(snowX, snowY, 10, 10);
  }
  void lookDown()
  {
    //your code here
    if ((snowY > 0) && (snowY < WIDTH_HEIGHT))
    {
      if (get(snowX, snowY+1) != color(0))
        isMoving = false;
      else
        isMoving = true;
    }
  }
  void erase()
  {
    //your code here
    fill(0);
    stroke(0);
    ellipse(snowX, snowY, 12, 12);
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
    if (snowY > WIDTH_HEIGHT-2)
    {
      snowY = 0;
      snowX = (int)(Math.random()*(WIDTH_HEIGHT+1));
    }
  }

}
