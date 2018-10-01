Enemy enemy1;

class EnemyManager {
  EnemyManager() {
    enemy1 = new Enemy(width/2, 0, 0, 1);
  }
  
  void update() {
    enemy1.update();
  }
}
