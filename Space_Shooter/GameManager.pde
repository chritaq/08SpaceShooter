class GameManager {
  Enemy[] enemies;
  
  int enemiesToSpawn = 30;
  int enemiesDead = 0;
  int timeCheckForSpawn;
  int timeIntervalForSpawn = 500;
  int enemiesSpawned = 0; 
  boolean startSpawn = false;
  
  int points = 0;
  
  
  GameManager() {
    enemies = new Enemy[enemiesToSpawn];
    timeCheckForSpawn = millis();
  }
  
  void update() {
    randomEnemySpawner();
    if(startSpawn == true) {
      updateEnemies();
    }
    scorePoint();
    checkStageClear();
  }
  
  void randomEnemySpawner() {
    if(millis() > timeCheckForSpawn + timeIntervalForSpawn && enemiesSpawned < enemiesToSpawn) {
      timeCheckForSpawn = millis();
      enemies[enemiesSpawned] = new Enemy(new PVector(random(0, width), 0), new PVector(0, 1));
      enemies[enemiesSpawned].setEnemyType((int)random(0, 2.99));
      enemiesSpawned++;
      if(startSpawn == false) {
        startSpawn = true;
      }
    }
  }
  
  void updateEnemies() {
    for(int i = 0; i < enemiesSpawned; i++) {
      enemies[i].update();
      if(enemies[i].alive) {
        enemiesDead += enemies[i].checkOutOfBounds();
      }
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
       
       for(int j = 0; j < enemiesSpawned; j++) {
         PVector enemyPos = new PVector();
         enemyPos.x = enemies[j].getPosition("x");
         enemyPos.y = enemies[j].getPosition("y");
         float enemySize = enemies[j].getSize();
       
         boolean collided = checkCollision(bulletPos, bulletSize * 1.2, enemyPos, enemySize);
         
         if(collided) {
           enemiesDead = enemiesDead + enemies[j].loseHealth();
           player.bullets[i].destroy("Player");
           points++;
         }
       }
    }
  }
  
  void checkPlayerShot() {
   for (int i = 0; i < enemiesSpawned; i++) {
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
       
       boolean collided = checkCollision(bulletPos, bulletSize, playerPos, playerSize/2);
       
       if(collided) {
         player.destroy("Player");
         enemies[i].bullets[j].destroy("Enemy");
       }
     }
   }
  }
  
  void checkPlayerEnemyCollision() {
    for(int i = 0; i < enemiesSpawned; i++) {
      PVector enemyPos = new PVector();
      enemyPos.x = enemies[i].getPosition("x");
      enemyPos.y = enemies[i].getPosition("y");
      float enemySize = enemies[i].getSize();
      
      PVector playerPos = new PVector();
      playerPos.x = player.getPosition("x");
      playerPos.y = player.getPosition("y");
      float playerSize = player.getSize();
      
      boolean collided = checkCollision(enemyPos, enemySize, playerPos, playerSize/2);
      
      if(collided) {
         player.destroy("Player");
         enemies[i].destroy("Enemy");
         enemiesDead = enemiesDead + 1;
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
  
  void checkStageClear() {
    if(enemiesDead == enemiesToSpawn) {
      text ("You Win", width/2 - textWidth("You Win")/2 , height/2);
    }
  }
  
  void scorePoint() {
    fill(255,10,10);
    text("Score " + points, 0, 20); 
  }

}
