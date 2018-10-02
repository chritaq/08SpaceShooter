Enemy enemy1;
//Enemy enemy2;
//Enemy enemy3;
//Enemy enemy4;

class EnemyManager {
  EnemyManager() {
    enemy1 = new Enemy(new PVector(width/2, 0), new PVector(0, 1));
    //enemy2 = new Enemy(new PVector(width/2 - 20, 0), new PVector(0, 1));
    //enemy3 = new Enemy(new PVector(width/2 - 40, 0), new PVector(0, 1));
    //enemy4 = new Enemy(new PVector(width/2 + 20, 0), new PVector(0, 1));
  }
  
  void update() {
    updateEnemies();
    //enemy1.bullets[i].getPosition();
  }
  
  void updateEnemies() {
    enemy1.update();
    //enemy2.update();
    //enemy3.update();
    //enemy4.update();
  }

  //int numberOfEnemies() {
    
  //  return enemies;
  //}
}
