class Enemy extends Ship{
  int hitPoints;
  int enemyTypeSelected;
  float startPosX;
  float colourDamaged = 0;
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
    fill (255,colourDamaged,colourDamaged);
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
      hitPoints = 6;
      
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
        hitPoints = 10;
        
        velocity.x = 1.5;
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
      ellipse(position.x, position.y, size/2, size * 1.5);  
      ellipse(position.x, position.y, size * 1.5, size/2); 
    }
  }
  
  int loseHealth() {
    colourDamaged += 255/hitPoints;
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
