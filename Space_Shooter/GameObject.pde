class GameObject {
  PVector position;
  PVector velocity;
  float size;
  PVector colour;
  
  boolean alive = true;
  
  GameObject (PVector newPos, PVector newVel) {
    position = newPos;
    velocity = newVel;
    size = 20;
  }
  
  GameObject (PVector newPos) {
    position = newPos;
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
  
  void updatePosWithVel() {
    position.x += velocity.x;
    position.y += velocity.y;
  }
  
  float getPosition(String axis) {
    if(axis == "x") {
      return position.x;
    }
    if(axis == "y") {
      return position.y;
    }
    else {
      return 0;
    }
  }
  
  PVector getPosition() {
    return position;
  }
  
  float getSize() {
    return size;
  }
  
  void destroy(String enemyOrPlayer) {
    if(true) {
      alive = false;
    }
    size = 0;
    if(enemyOrPlayer == "Enemy") {
      position.x = 0 - 100;
    }
    else if(enemyOrPlayer == "Player") {
      position.x = width + 100;
    }
    
  }
}
