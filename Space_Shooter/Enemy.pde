class Enemy extends GameObject{
  Bullet bullet;
  
  int firingRate;
  int nextBullet;
  PVector bulletSpeed;
  PVector bulletPosition;
  boolean alive = true;
  boolean startFire = false;

  Enemy(PVector newPos, PVector newVel) {
    super(newPos, newVel);
    
    firingRate = 50;
    bulletSpeed = new PVector();
    bulletPosition = new PVector();
  }
  
  Enemy(PVector newPos, PVector newVel, float newSize) {
    super(newPos, newVel, newSize);
    firingRate = 50;
    bulletSpeed = new PVector();
    bulletPosition = new PVector();
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
