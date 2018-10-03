class EnemyManager {
  //Enemy enemy1;
  Enemy[] enemies;
  
  int enemiesToKill = 10;
  int timeCheck;
  int timeInterval = 500;
  int numberOfEnemies = 0; 
  
  boolean startSpawn = false;
  
  EnemyManager() {
    enemies = new Enemy[enemiesToKill];
    
    timeCheck = millis();
  }
  
  void update() {
    enemySpawner();
    if(startSpawn == true) {
      updateEnemies();
    }
  }
  
  void enemySpawner() {
    if(millis() > timeCheck + timeInterval && numberOfEnemies < enemiesToKill) {
      timeCheck = millis();
      enemies[numberOfEnemies] = new Enemy(new PVector(random(0, width), 0), new PVector(0, 1), 9);
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
  }
  
  
  void checkEnemyShot() {
    
  }
  
  void checkPlayerShot() {
   for (int i = 0; i < numberOfEnemies; ++i) {
     //Get the amount of bullets each enemy has.
     int bulletPerEnemy = enemies[i].bulletsFired;
     
     
     //Gets the position of each bullets.
     for(int j = 0; j < bulletPerEnemy; j++) {
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
         player.destroy();
         enemies[i].bullets[j].destroy();
       }
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
  
  //void getBulletPosition() {
  //  Testkod för att hämta positionen för enemy bullets. Funkar! :)
  //  if(enemy1.bullets[0] != null) {
  //    print(enemy1.bullets[0].getPosition());
  //  }
  //}

}
