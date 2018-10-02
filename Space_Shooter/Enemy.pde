class Enemy extends Ship{

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
      destroyByBullet();
    }
  }
  
  void moveEnemy() {
    super.updatePosWithVel();
    ellipse(position.x, position.y, size, size);
  }
  
  void shoot() {
    if(bulletsFired < amountOfBullets) {
      super.createBullets();
    }
      super.updateBullets();
  }
  
}
