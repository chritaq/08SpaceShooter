EnemyManager enemyManager;
Player player;

void setup() {
  size(360, 540);
  enemyManager = new EnemyManager();
  player = new Player(new PVector(width/2, 500));
  
}

void draw() {
  background(255, 255, 255);
  enemyManager.update();
  player.update();
}
