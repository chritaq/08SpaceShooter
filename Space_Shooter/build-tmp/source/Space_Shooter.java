import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Space_Shooter extends PApplet {

EnemyManager enemyManager;
Bullet bullets;

public void setup() {
  
  enemyManager = new EnemyManager();
  bullets = new Bullet();
}

public void draw() {
  background(255, 255, 255);
  //enemyManager.update();
  bullets.update();
}
class Bullet {

	PVector position;
	PVector velocity;

	public Bullet(PVector newPos, PVector newVel) {
		position = newPos;
		velocity = newVel;
		

	}

	public void update() {
		position.x += velocity.x;
		position.y += velocity.y;
		strokeWeight(5);
		point(position.x, position.y);

	}

}


/*void draw() {
	point(position.x, position.y);
	bullet.update();
}*/
PVector position;
PVector velocity;
float firingRate;
float size;

class Enemy{
  Enemy(float posX, float posY, float velX, float velY) {
    position = new PVector();
    position.x = posX;
    position.y = posY;
    
    velocity = new PVector();
    velocity.x = velX;
    velocity.y = velY;
    
    firingRate = 10;
    size = 20;
  }
  
  public void update() {
    moveEnemy();
  }
  
  public void moveEnemy() {
    ellipse(position.x, position.y, size, size);
    position.x += velocity.x;
    position.y += velocity.y;
  }
  
  public void shoot() {
    print("Enemy is firing");
  }
  
  public void destroy() {
  
  }
  
}
Enemy enemy1;

class EnemyManager {
  EnemyManager() {
    enemy1 = new Enemy(width/2, 0, 0, 1);
  }
  
  public void update() {
    enemy1.update();
  }
}
  public void settings() {  size(360, 540); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Space_Shooter" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
