Bullet bullet;

PVector position;
PVector velocity;
int firingRate;
int nextBullet;
PVector bulletSpeed;
PVector bulletPosition;
float size;
boolean alive = true;
boolean startFire = false;

class Enemy{
  Enemy(float posX, float posY, float velX, float velY) {
    position = new PVector();
    position.x = posX;
    position.y = posY;
    
    velocity = new PVector();
    velocity.x = velX;
    velocity.y = velY;
    
    firingRate = 50;
    bulletSpeed = new PVector();
    bulletPosition = new PVector();
    size = 20;
  }
  
  void update() {
    if(alive) {
      moveEnemy();
      shoot();
      destroy();
    }
    
  }
  
  void moveEnemy() {
    ellipse(position.x, position.y, size, size);
    position.x += velocity.x;
    position.y += velocity.y;
  }
  
  void shoot() {
    nextBullet++;
    
    if(nextBullet == firingRate) {
      nextBullet = 0;
      bulletPosition.x = position.x;
      bulletPosition.y = position.y;
      bulletSpeed.x = 0;
      bulletSpeed.y = velocity.y + 5;
      
      bullet = new Bullet(bulletPosition, bulletSpeed);
      //print("Enemy is firing");
      if(startFire == false) {
        startFire = true;
      }
    }
    
    
    
    if(startFire == true) {
      bullet.update();
    }
    
  }
  
  void destroy() {
    //add if collision happens
    //if(true) {
    //  alive = false;
    //}
  }
  
}
