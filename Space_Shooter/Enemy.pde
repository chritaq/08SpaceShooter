class Enemy extends Ship{
  int hitPoints;

  Enemy(PVector newPos, PVector newVel) {
    super(newPos, newVel);
  }
  
  Enemy(PVector newPos, PVector newVel, float newSize) {
    super(newPos, newVel, newSize);
  }
  
  void update() {
    if(alive) {
      moveEnemy();
      shoot();
    }
    super.updateBullets();
  }
  
  void moveEnemy() {
    super.updatePosWithVel();
    ellipse(position.x, position.y, size, size);
  }
  
  void shoot() {
    if(bulletsFired < amountOfBullets) {
      super.createBullets("DOWN", "enemy");
    }
  }
  
  void setEnemyType(int enemyType) {
    if(enemyType == 0) {
      hitPoints = 3;
      amountOfBullets = 3;
    }
    if(enemyType == 1) {
      hitPoints = 5;
      amountOfBullets = 10;
    }
  }
  
  void loseHealth() {
    if(hitPoints > 1) {
      hitPoints--;
    }
    else {
      this.destroy("Enemy");
    }
  }
  
  
}
