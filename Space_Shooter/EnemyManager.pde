Enemy enemy1;

class EnemyManager {
  EnemyManager() {
    enemy1 = new Enemy(width/2, 0, 0, 1);
  }
  
  void update() {
    updateEnemies();
  }
  
  void updateEnemies() {
    enemy1.update();
  }
  
}
