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

public void setup() {
  
  enemyManager = new EnemyManager();
  
}

public void draw() {
  background(255, 255, 255);
  enemyManager.update();
}
class Bullet extends GameObject {


	public Bullet(PVector newPos, PVector newVel) {
		super(newPos, newVel);
		size = 5;
	}

	public void update() {
		super.updatePosWithVel();
		ellipse(position.x, position.y, size, size);

	}

}
// //ej klar, kolla och byt ut namn! enemy.length?
// void hitEnemy() {
// 	for (int i = 0; i < numberOfEnemy; ++i) {

// 		for (int j = 0; j < numberOfBullet; ++j) {
// 			boolean hasCollided = collision(enemy[i].position.x,
// 											enemy[i].position.y, 
// 											enemy[i].size/2,
// 											bullet[j].position.x, 
// 											bullet[j].position.y, 
// 											bullet[j].size/2);			
// 		}
// 	}
// }

// //ej klar, kolla och byt ut namn!
// void hitPlayer() {
// 	for (int i = 0; i < player; ++i) {

// 		for (int j = 0; j < numberOfBullet; ++j) {
// 			boolean hasCollided = collision(player[i].position.x,
// 											player[i].position.y, 
// 											player[i].size/2,
// 											bullet[j].position.x, 
// 											bullet[j].position.y, 
// 											bullet[j].size/2);		
// 		}
// 	}
// }
// //ej klar, kolla och byt ut namn!
// void hitPlayerEnemy() {
// 	for (int i = 0; i < player; ++i) {

// 		for (int j = 0; j < numberOfEnemy; ++j) {
// 			boolean hasCollided = collision(player[i].position.x,
// 											player[i].position.y, 
// 											player[i].size/2,
// 											enemy[j].position.x, 
// 											enemy[j].position.y, 
// 											enemy[j].size/2);	
// 		}
// 	}
// }











// boolean collision(float x1, float y1, int size1, float x2, float y2, int size2){

// 	int maxDistance = size1 + size2;

// 	if (abs(x1 - x2) > maxDistance || abs(y1 - y2) > maxDistance) {
// 		return false;
// 	}
// 	else if (dist(x1, y1, x2, y2) > maxDistance) {
// 		return false;
// 	}
// 	else {
// 		return true;
// 	}

	
// 	}
// }
class Enemy extends GameObject{
  Bullet[] bullets;
  
  int firingRate = 10;
  int nextBullet;
  int amountOfBullets = 10;
  int bulletsFired = 0;
  //int hitPoints;
  
  boolean alive = true;
  boolean startFire = false;

  Enemy(PVector newPos, PVector newVel) {
    super(newPos, newVel);
    bullets = new Bullet[amountOfBullets];
  }
  
  Enemy(PVector newPos, PVector newVel, float newSize) {
    super(newPos, newVel, newSize);
    bullets = new Bullet[amountOfBullets];
  }
  
  public void update() {
    if(alive) {
      moveEnemy();
      shoot();
      destroyByBullet();
    }
  }
  
  public void moveEnemy() {
    super.updatePosWithVel();
    ellipse(position.x, position.y, size, size);
    
  }
  
  public void shoot() {
    nextBullet++;
    
    if(nextBullet == firingRate && bulletsFired < amountOfBullets) {
          nextBullet = 0;
          PVector bulletPosition = new PVector(position.x, position.y);
          PVector bulletSpeed = new PVector(velocity.x, velocity.y + 5);
          
          bullets[bulletsFired] = new Bullet(bulletPosition, bulletSpeed);
          bulletsFired++;
    }
    for(int i = 0; i < bulletsFired; i++) {
      bullets[i].update();
    }
  }
  
  public void destroyByBullet() {
    //add if collision happens
    //if(true) {
    //  alive = false;
    //}
  }
  
  //int numberOfBullets() {
  //  //numberOfBullets = bulletsFired;
  //  //return numberOfBullets();
  //}
  
}
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
  
  public void update() {
    updateEnemies();
  }
  
  public void updateEnemies() {
    enemy1.update();
    //enemy2.update();
    //enemy3.update();
    //enemy4.update();
  }

  //int numberOfEnemies() {
    
  //  return enemies;
  //}
}
class GameObject {
  PVector position;
  PVector velocity;
  float size;
  PVector colour;
  
  GameObject (PVector newPos, PVector newVel) {
    position = newPos;
    velocity = newVel;
    size = 20;
  }
  
  GameObject (PVector newPos, PVector newVel, float newSize) {
    position = newPos;
    velocity = newVel;
    size = newSize;
  }
  
  GameObject (PVector newPos, PVector newVel, float newSize, PVector newColour) {
    position = newPos;
    velocity = newVel;
    size = newSize;
    colour = newColour;
  }
  
  public void updatePosWithVel() {
    position.x += velocity.x;
    position.y += velocity.y;
  }
  
  public PVector getPosition() {
    return position;
  }
}
//Använd detta för att koppla till 
//spelarens rörelse och input.

//För movement:
//Du får tillgång till huruvida en knapp trycks ned genom:
//getAxisRaw("direction").
//skriv "horizontal" i "direction" för att få tillgång till höger/vänster
//och "vertical" för att få tillgång till upp/ned.
//Detta ger dig ett float-värde på -1 eller 1.
//Skriver du getAxisRaw("horizontal") och håller ned vänster så kommer den att
//spotta ut ett float-värde på -1, håller du ned höger spottar den ut 1.

//För shooting:
//Du får tillgång till huruvida en knapp trycks ned genom:
//getButton("x").
//ger dig en boolean som är true om knappen x trycks ned, annars false.

boolean moveUp;
boolean moveDown;
boolean moveLeft;
boolean moveRight;
boolean shoot;
boolean slowMove;

public void keyPressed() {
  if (key == CODED) {
    if(keyCode == UP) {
      moveUp = true;
    }
    if(keyCode == DOWN) {
      moveDown = true;
    }
    if(keyCode == LEFT) {
      moveLeft = true;
    }
    if(keyCode == RIGHT) {
      moveRight = true;
    }
  }
  if(key == 'x') {
    shoot = true;
  }
  if(key == 'z') {
    slowMove = true;
  }
  
}

public void keyReleased() {
  if (key == CODED) {
    if(keyCode == UP) {
      moveUp = false;
    }
    if(keyCode == DOWN) {
      moveDown = false;
    }
    if(keyCode == LEFT) {
      moveLeft = true;
    }
    if(keyCode == RIGHT) {
      moveRight = true;
    }
  }
  
  if(key == 'z') {
    slowMove = true;
  }
  
  if(key == 'x') {
    shoot = true;
  }
}

public float getAxisRaw(String axis) {
  if(axis == "Vertical") {
    if(moveUp) {
      return -1;
    }
    if(moveDown) {
      return 1;
    }
  }
  if(axis == "Horizontal") {
    if(moveLeft) {
      return -1;
    }
    if(moveRight) {
      return 1;
    }
  }
  return 0;
}

public boolean getButton(String button) {
  if(button == "z") {
    if (slowMove) {
      return true;
    }
  }
  if(button == "x") {
    if (shoot) {
      return true;
    }
  }
  return false;
}
//class Ship extends GameObject {

//  Ship(PVector newPos, PVector newVel) {
//    super(newPos, newVel);
//    bullets = new Bullet[amountOfBullets];
//  }
//}
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
