class GameManager {
  //Enemy enemy1;
  Enemy[] enemies;
  
  int enemiesToKill = 10;
  int timeCheck;
  int timeInterval = 500;
  int numberOfEnemies = 0; 
  
  int points = 0;
  
  boolean startSpawn = false;
  
  GameManager() {
    enemies = new Enemy[enemiesToKill];
    
    timeCheck = millis();
  }
  
  void update() {
    enemySpawner();
    if(startSpawn == true) {
      updateEnemies();
    }
    scorePoint();
  }
  
  void enemySpawner() {
    if(millis() > timeCheck + timeInterval && numberOfEnemies < enemiesToKill) {
      timeCheck = millis();
      enemies[numberOfEnemies] = new Enemy(new PVector(random(0, width), 0), new PVector(0, 1), 9);
      enemies[numberOfEnemies].setEnemyType(0);
      numberOfEnemies++;
      if(startSpawn == false) {
        startSpawn = true;
      }
    }
  }
  
  void updateEnemies() {
    for(int i = 0; i < numberOfEnemies; i++) {
      enemies[i].update();
    }
    checkPlayerShot();
    checkEnemyShot();
    checkPlayerEnemyCollision();
  }
  
  
  void checkEnemyShot() {
    int bulletsFromPlayer = player.bulletsFired;
    for(int i = 0; i < bulletsFromPlayer; i++) {
       PVector bulletPos = new PVector();
       bulletPos.x = player.bullets[i].getPosition("x");
       bulletPos.y = player.bullets[i].getPosition("y");
       float bulletSize = player.bullets[i].getSize();
       
       for(int j = 0; j < numberOfEnemies; j++) {
         PVector enemyPos = new PVector();
         enemyPos.x = enemies[j].getPosition("x");
         enemyPos.y = enemies[j].getPosition("y");
         float enemySize = enemies[j].getSize();
       
         boolean collided = checkCollision(bulletPos, bulletSize, enemyPos, enemySize);
         
         if(collided) {
           enemies[j].loseHealth();
           player.bullets[i].destroy("Player");
           points++;
         }
       }
    }
  }
  
  void checkPlayerShot() {
   for (int i = 0; i < numberOfEnemies; i++) {
     //Get the amount of bullets each enemy has.
     int bulletsPerEnemy = enemies[i].bulletsFired;
     
     
     //Gets the position of each bullets.
     for(int j = 0; j < bulletsPerEnemy; j++) {
       PVector bulletPos = new PVector();
       bulletPos.x = enemies[i].bullets[j].getPosition("x");
       bulletPos.y = enemies[i].bullets[j].getPosition("y");
       float bulletSize = enemies[i].bullets[j].getSize();
       
       PVector playerPos = new PVector();
       playerPos.x = player.getPosition("x");
       playerPos.y = player.getPosition("y");
       float playerSize = player.getSize();
       
       boolean collided = checkCollision(bulletPos, bulletSize, playerPos, playerSize);
       
       if(collided) {
         player.destroy("Player");
         enemies[i].bullets[j].destroy("Enemy");
       }
     }
   }
  }
  
  void checkPlayerEnemyCollision() {
    for(int i = 0; i < numberOfEnemies; i++) {
      PVector enemyPos = new PVector();
      enemyPos.x = enemies[i].getPosition("x");
      enemyPos.y = enemies[i].getPosition("y");
      float enemySize = enemies[i].getSize();
      
      PVector playerPos = new PVector();
      playerPos.x = player.getPosition("x");
      playerPos.y = player.getPosition("y");
      float playerSize = player.getSize();
      
      boolean collided = checkCollision(enemyPos, enemySize, playerPos, playerSize);
      
      if(collided) {
         player.destroy("Player");
         enemies[i].destroy("Enemy");
      }
    }
  }
  
  boolean checkCollision(PVector pos1, float size1, PVector pos2, float size2) {
    float maxDistance = size1 + size2;
    
    if(abs(pos1.x - pos2.x) > maxDistance || abs(pos1.y - pos2.y) > maxDistance) {
      return false;
    }
    
    else if(dist(pos1.x, pos1.y, pos2.x, pos2.y) > maxDistance) {
      return false;
    }
    
    else {
      return true;
    }

  }
  
  void scorePoint() {
    text("Score " + points, 0, 20); 
  }

}
