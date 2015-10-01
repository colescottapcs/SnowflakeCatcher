ArrayList<Snowflake> snowflakes = new ArrayList<Snowflake>();

void setup()
{
  size(500,500);
  background(0);
  for(int i = 0; i < 100; i++)
  {
    snowflakes.add(new Snowflake());
  }
}
void draw()
{
  if(mousePressed)
  {
    stroke(255,0,0);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  for(Snowflake s : snowflakes)
  {
    s.erase();
    s.lookDown();
    s.move();
    s.show();
  }
}

class Snowflake
{
  int x;
  int y;
  int size = 5;
  boolean isMoving = true;
  Snowflake()
  {
    x = (int)(Math.random() * (width - 10)) + 5;
    y = (int)(Math.random() * (height - 10));
  }
  void show()
  {
    fill(255);
    stroke(0);
    ellipse(x, y, size, size);
  }
  void lookDown()
  {
    
    isMoving = (get(x - 5, y + 5) == color(0)) && (get(x, y + 5) == color(0)) && (get(x + 5, y + 5) == color(0));
  }
  void erase()
  {
    fill(0);
    stroke(0);
    ellipse(x, y, size + 2, size + 2);
  }
  void move()
  {
    if(isMoving)
    {
      x += (Math.random() * 3) - 1;
      if(x < 5) x = 5;
      if(x > width - 5) x = width - 5;
      y += 1;
      wrap();
    }
  }
  void wrap()
  {
    if(y + 10 > height)
    {
      y = 0;
      x = (int)(Math.random() * width - 10) + 5;
    }
  }
}


