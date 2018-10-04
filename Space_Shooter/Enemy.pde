class Enemy extends Ship{
  int hitPoints;
  int enemyTypeSelected;
  float startPosX;
  float colourDarkness = 255;
  boolean specialMovement = false;

  Enemy(PVector newPos, PVector newVel) {
    super(newPos, newVel);
    startPosX = position.x;
  }
  
  Enemy(PVector newPos, PVector newVel, float newSize) {
    super(newPos, newVel, newSize);
    startPosX = position.x;
  }
  
  void update() {
    if(alive) {
      moveEnemy();
      shoot();
    }
    super.updateBullets();
  }
  
  void moveEnemy() {
    fill (colourDarkness,10,10);
    if(specialMovement == true) {
      updateMovementPattern();
    }
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
      
      velocity.x = 0;
      velocity.y = 1;
      
      amountOfBullets = 3;
      firingRate = 10;
      timeBeforeShoot = 1000;
    }
    if(enemyType == 1) {
      hitPoints = 1;
      
      velocity.x = 0;
      velocity.y = 5;
      
      amountOfBullets = 0;
    }
    if(enemyType == 2) {
        hitPoints = 5;
        
        velocity.x = 1;
        velocity.y = 1;
        specialMovement = true;
        
        amountOfBullets = 10;
        firingRate = 5;
        timeBeforeShoot = 1000;
    }
    enemyTypeSelected = enemyType;
  }
  
  void updateMovementPattern() {
    if(enemyTypeSelected == 2) {
      if(position.x > startPosX + size*2 || position.x < startPosX - size*2) {
        velocity.x = -velocity.x;
      }
      
    }
  }
  
  void loseHealth() {
    if(hitPoints > 1) {
      hitPoints--;
    }
    else {
      this.destroy("Enemy");
    }
    colourDarkness -= 50;
  }
  
  
}
