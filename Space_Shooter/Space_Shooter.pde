EnemyManager enemyManager;
//Bullet bullets;

void setup() {
  size(360, 540);
  enemyManager = new EnemyManager();
  //bullets = new Bullet();
}

void draw() {
  background(255, 255, 255);
  enemyManager.update();
  //bullets.update();
}
