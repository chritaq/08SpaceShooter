EnemyManager enemyManager;

void setup() {
  size(360, 540);
  enemyManager = new EnemyManager();
}

void draw() {
  enemyManager.update();
}
