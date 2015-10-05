// snowflakes array
public final static int NUM_FLAKES = 100;
Snowflake[] flakes = new Snowflake[NUM_FLAKES];
Snowflake[] moreFlakes = new Snowflake[NUM_FLAKES];

public final static int WIDTH_HEIGHT = 500;
int randTheme = 0;

void setup()
{
  //your code here
  background(0);
  size(WIDTH_HEIGHT, WIDTH_HEIGHT);
  frameRate(1000);
  for (int i = 0; i < flakes.length; i++)
  {
    flakes[i] = new Snowflake();
  }
  for (int i = 0; i < moreFlakes.length; i++)
  {
    moreFlakes[i] = new Snowflake();
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

  for (int i = 0; i < flakes.length; i++)
  {
    if (flakes[i].isMoving == false)
    {
      moreFlakes[i].erase();
      moreFlakes[i].lookDown();
      moreFlakes[i].move();
      moreFlakes[i].wrap();
      moreFlakes[i].show();
      // System.out.println("This ran.");
    }
  }
}
void mouseMoved()
{
  //your code here
  noStroke();
  if (randTheme == 0)
  {
    fill(0, 255, 104); // 0, 255, 210
  }
  else if (randTheme == 1)
  {
    fill(255, 196, 0);
  }
  else
  {
    fill(255, 0, 136);  
  }
  rect(mouseX, mouseY, 10, 5);

}
void mouseClicked()
{
  randTheme = (int)(Math.random()*3);
  setup();
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
    noFill();
    if (randTheme == 0)
    {
      stroke(0, ((int)(Math.random()*255)+1), ((int)(Math.random()*255)+1));
    }
    else if (randTheme == 1)
    {
      stroke(((int)(Math.random()*255)+1), ((int)(Math.random()*255)+1), 0);
    }
    else 
    {
      stroke(((int)(Math.random()*255)+1), 0, ((int)(Math.random()*255)+1));
    }
    ellipse(snowX, snowY, 10, 10);
  }
  void lookDown()
  {
    //your code here
    if ((snowY > 0) && (snowY < WIDTH_HEIGHT))
    {
      if ( (get(snowX, snowY+7) != color(0)) )
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
    if (snowY > WIDTH_HEIGHT-10)
    {
      snowY = 0;
      snowX = (int)(Math.random()*(WIDTH_HEIGHT+1));
    }
  }

}
