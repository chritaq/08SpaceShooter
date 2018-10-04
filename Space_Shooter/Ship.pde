class Ship extends GameObject {
  Bullet[] bullets;
  
  int firingRate = 10;
  int nextBullet;
  int amountOfBullets;
  int bulletsFired = 0;
  float bulletSpeed = 5;
  float timeBeforeShoot = 3000;
  int timeCheck;
  boolean startShoot = false;
  
  boolean bulletFix = false;
  
  Ship(PVector newPos, PVector newVel) {
    super(newPos, newVel);
    amountOfBullets = 10;
    bullets = new Bullet[amountOfBullets];
    timeCheck = millis();
  }
  
  Ship(PVector newPos, PVector newVel, float newSize) {
    super(newPos, newVel, newSize);
    bullets = new Bullet[amountOfBullets];
    timeCheck = millis();
  }
  
  
  void createBullets(String direction, String playerOrEnemy) {
    if(playerOrEnemy == "Player") {
      startShoot = true;
    }
    else if(startShoot == false){
      waitTillFire();
    }
    if(startShoot == true) {
      nextBullet++;
      if(nextBullet == firingRate || bulletsFired == 0) {
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
            bulletFix = true;
          }
      }
    }
  }
  
  void waitTillFire() {
    if(millis() > timeCheck + timeBeforeShoot) {
        timeCheck = millis();
        if(startShoot == false) {
          startShoot = true;
        }
      }
  }
  
  void updateBullets() {
    for(int i = 0; (i < bulletsFired && bulletFix == false) || (i < amountOfBullets && bulletFix == true); i++) {
      bullets[i].update();
    }
  }
  
  int getBulletsFired() {
    return bulletsFired;
  }
  
}
