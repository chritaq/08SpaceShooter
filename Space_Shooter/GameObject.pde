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
  
  PVector getPosition() {
    return position;
  }
}
