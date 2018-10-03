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
      enemies[numberOfEnemies] = new Enemy(new PVector(random(0, width), 0), new PVector(0, 1));
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
  }
  
  
  void checkCollission() {
   for (int j = 0; j < numberOfEnemies; ++j) {
     //Get the amount of bullets each enemy has.
     int bulletPerEnemy = enemies[j].bulletsFired;
     
     //Gets the position of each bullets.
     for(int h = 0; h < bulletPerEnemy; h++) {
       PVector bulletPos = new PVector(enemies[j].bullets[h].getPosition("x"); );
       //enemies[j].bullets[h].size;   
     }
 }
  }
  
  //void getBulletPosition() {
  //  Testkod för att hämta positionen för enemy bullets. Funkar! :)
  //  if(enemy1.bullets[0] != null) {
  //    print(enemy1.bullets[0].getPosition());
  //  }
  //}

}
