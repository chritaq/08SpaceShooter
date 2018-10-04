class Ship extends GameObject {
  Bullet[] bullets;
  
  int firingRate = 10;
  int nextBullet;
  int amountOfBullets;
  int bulletsFired = 0;
  float bulletSpeed = 5;
  

  
  Ship(PVector newPos, PVector newVel) {
    super(newPos, newVel);
    amountOfBullets = 10;
    bullets = new Bullet[amountOfBullets];
  }
  
  Ship(PVector newPos, PVector newVel, int newAmountOfBullets) {
    super(newPos, newVel);
    amountOfBullets = newAmountOfBullets;
    bullets = new Bullet[amountOfBullets];
  }
  
  Ship(PVector newPos, PVector newVel, int newAmountOfBullets, float newSize) {
    super(newPos, newVel, newSize);
    amountOfBullets = newAmountOfBullets;
    bullets = new Bullet[amountOfBullets];
  }
  
  
  void createBullets(String direction, String playerOrEnemy) {
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
        if(playerOrEnemy == "Player" && bulletsFired == amountOfBullets) {
          bulletsFired = 0;
        }
    }
  }
  
  
  void updateBullets() {
    for(int i = 0; i < bulletsFired; i++) {
      bullets[i].update();
    }
  }
  
  int getBulletsFired() {
    return bulletsFired;
  }
  
}
