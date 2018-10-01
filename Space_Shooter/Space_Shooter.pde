EnemyManager enemyManager;

void setup() {
  size(360, 540);
  enemyManager = new EnemyManager();
  
}

void draw() {
  background(255, 255, 255);
  enemyManager.update();
  
}
