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
    drawEnemyType();
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
      
      amountOfBullets = 50;
      firingRate = 70;
      timeBeforeShoot = 0;
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
  
  void drawEnemyType() {
    if(enemyTypeSelected == 0) {
      ellipse(position.x, position.y, size, size);  
    }
    if(enemyTypeSelected == 1) {
      //ellipse(position.x, position.y, size, size);
      triangle          (position.x - size/2, position.y - size/2, 
                        position.x, position.y + size/2, 
                        position.x + size/2, position.y - size/2);
    }
    if(enemyTypeSelected == 2) {
      ellipse(position.x, position.y, size/5, size);  
      ellipse(position.x, position.y, size, size/5); 
    }
  }
  
  int loseHealth() {
    colourDarkness -= 50;
    if(hitPoints > 1) {
      hitPoints--;
      return 0;
    }
    else {
      this.destroy("Enemy");
      return 1;
    }
  }
  
  int checkOutOfBounds() {
    if(position.y > height) {
      this.destroy("Enemy");
      return 1;
    }
    else {
      return 0;
    }
  }
  
}
