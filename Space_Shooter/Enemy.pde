class Enemy extends Ship{

  Enemy(PVector newPos, PVector newVel, int newAmountOfBullets) {
    super(newPos, newVel, newAmountOfBullets);
  }
  
  Enemy(PVector newPos, PVector newVel, int newAmountOfBullets, float newSize) {
    super(newPos, newVel, newAmountOfBullets, newSize);
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
  
  
}
