class EnemyManager {
  //Enemy enemy1;
  Enemy[] enemies;
  int enemiesToKill = 10;
  float timeBetweenSpawn = 100;
  float timeSpawnCounter;
  float timeSinceStart;
  
  EnemyManager() {
    enemies = new Enemy[enemiesToKill];
    for(int i = 0; i < enemiesToKill; i++) {
      enemies[i] = new Enemy(new PVector(random(0, width), random(-100, 0)), new PVector(0, 1));
    }
  }
  
  void update() {
    updateEnemies();
  }
  
  void enemySpawner() {
    timeSinceStart = millis();
    
  }
  
  void updateEnemies() {
    for(int i = 0; i < enemiesToKill; i++) {
      enemies[i].update();
    }
    //enemy1.update();
  }
  
  void timer() {
    
    
  }
  
  //void getBulletPosition() {
  //  Testkod för att hämta positionen för enemy bullets. Funkar! :)
  //  if(enemy1.bullets[0] != null) {
  //    print(enemy1.bullets[0].getPosition());
  //  }
  //}

}
