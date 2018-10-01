PVector position;
PVector velocity;
float firingRate;
float size;

class Enemy{
  Enemy(PVector pos, PVector vel) {
    position = new PVector();
    position.x = pos.x;
    position.y = pos.y;
    
    velocity = new PVector();
    velocity.x = vel.x;
    velocity.y = vel.y;
    
    firingRate = 10;
  }
  
  void update() {
    moveEnemy();
  }
  
  void moveEnemy() {
    ellipse(position.x, position.y, size, size);
    position.x += velocity.x;
    position.y += velocity.y;
  }
  
  void fire() {
    print("Enemy is firing");
  }
  
  void destroy() {
  
  }
  
}
