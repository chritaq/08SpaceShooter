EnemyManager enemyManager;
Player player;
int score;


void setup() {
  size(360, 540);
  enemyManager = new EnemyManager();
  player = new Player(new PVector(width/2, 500));
  
}

void draw() {
 if (player.alive) {
   background(255, 255, 255);
  enemyManager.update();
  player.update();
 text("Score " + score, 0, 20); 
 }
 
 else {
 text ("Game Over", width/2 - textWidth("Game Over")/2 , height/2);
 }

  
}
