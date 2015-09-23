// snowflakes array
int NUM_FLAKES = 100;
Snowflake[] flakes = new Snowflake[NUM_FLAKES];

int WIDTH_HEIGHT = 500;

void setup()
{
  //your code here
  size(WIDTH_HEIGHT, WIDTH_HEIGHT);
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
  noStroke();
  fill(0, 0, 255);
  rect(mouseX, mouseY, 10, 10);
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
    snowX = (int)(Math.random()*(WIDTH_HEIGHT+1));
    snowY = (int)(Math.random()*(WIDTH_HEIGHT+1));
    isMoving = true;
  }
  void show()
  {
    //your code here
    noFill();
    stroke((int)(Math.random()*255));
    ellipse(snowX, snowY, 10, 10);
  }
  void lookDown()
  {
    //your code here
    if ((snowY > 0 && snowY < WIDTH_HEIGHT) && (get(snowX, snowY-1)) != color(0))
      isMoving = false;
    else
      isMoving = true;
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
    if (snowY > WIDTH_HEIGHT)
    {
        snowY = 0;
        snowX = (int)(Math.random()*(WIDTH_HEIGHT+1));
    }
  }
}


