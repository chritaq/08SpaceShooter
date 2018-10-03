class Ship extends GameObject {
  Bullet[] bullets;
  
  int firingRate = 10;
  int nextBullet;
  int amountOfBullets = 10;
  int bulletsFired = 0;
  float bulletSpeed = 5;
  
  boolean alive = true;
  
  
  Ship(PVector newPos, PVector newVel) {
    super(newPos, newVel);
    bullets = new Bullet[amountOfBullets];
  }
  
  Ship(PVector newPos, PVector newVel, float newSize) {
    super(newPos, newVel, newSize);
    bullets = new Bullet[amountOfBullets];
  }
  
  
  void createBullets(String direction) {
    nextBullet++;
    if(nextBullet == firingRate) {
        nextBullet = 0;
        PVector bulletFiredPosition = new PVector(position.x, position.y);
        if(direction == "UP") {
          PVector bulletFiredSpeed = new PVector(velocity.x, velocity.y - bulletSpeed);
          bullets[bulletsFired] = new Bullet(bulletFiredPosition, bulletFiredSpeed);  
        }
        if(direction == "DOWN") {
          PVector bulletFiredSpeed = new PVector(velocity.x, velocity.y + bulletSpeed);
          bullets[bulletsFired] = new Bullet(bulletFiredPosition, bulletFiredSpeed);
        }
        bulletsFired++;
    }
  }
  
  
  void updateBullets() {
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
  
  
  int getBulletsFired() {
    return bulletsFired;
  }
  
}
