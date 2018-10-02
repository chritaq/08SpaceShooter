class Enemy extends GameObject{
  Bullet[] bullets;
  
  int firingRate = 10;
  int nextBullet;
  int amountOfBullets = 10;
  int bulletsFired = 0;
  //int hitPoints;
  
  boolean alive = true;
  boolean startFire = false;

  Enemy(PVector newPos, PVector newVel) {
    super(newPos, newVel);
    bullets = new Bullet[amountOfBullets];
  }
  
  Enemy(PVector newPos, PVector newVel, float newSize) {
    super(newPos, newVel, newSize);
    bullets = new Bullet[amountOfBullets];
  }
  
  void update() {
    if(alive) {
      moveEnemy();
      shoot();
      destroyByBullet();
    }
  }
  
  void moveEnemy() {
    super.updatePosWithVel();
    ellipse(position.x, position.y, size, size);
    
  }
  
  void shoot() {
    nextBullet++;
    if(nextBullet == firingRate && bulletsFired < amountOfBullets) {
          nextBullet = 0;
          PVector bulletPosition = new PVector(position.x, position.y);
          PVector bulletSpeed = new PVector(velocity.x, velocity.y + 5);
          
          print(bulletsFired);
          bullets[bulletsFired] = new Bullet(bulletPosition, bulletSpeed);
          bulletsFired++;
    }
    for(int i = 0; i < bulletsFired; i++) {
      bullets[i].update();
    }
  }
  
  void destroyByBullet() {
    //add if collision happens
    //if(true) {
    //  alive = false;
    //}
  }
  
}
