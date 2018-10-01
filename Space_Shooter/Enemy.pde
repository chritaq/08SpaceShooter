PVector position;
PVector velocity;
float firingRate;
float size;

class Enemy{
  Enemy(float posX, float posY, float velX, float velY) {
    position = new PVector();
    position.x = posX;
    position.y = posY;
    
    velocity = new PVector();
    velocity.x = velX;
    velocity.y = velY;
    
    firingRate = 10;
    size = 20;
  }
  
  void update() {
    moveEnemy();
  }
  
  void moveEnemy() {
    ellipse(position.x, position.y, size, size);
    position.x += velocity.x;
    position.y += velocity.y;
  }
  
  void shoot() {
    print("Enemy is firing");
  }
  
  void destroy() {
  
  }
  
}
