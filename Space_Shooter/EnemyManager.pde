Enemy enemy1;

class EnemyManager {
  EnemyManager() {
    enemy1 = new Enemy(new PVector(width/2, 0), new PVector(0, 1));
  }
  
  void update() {
    updateEnemies();
  }
  
  void updateEnemies() {
    enemy1.update();
  }
  
}
