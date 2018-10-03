//Använd detta för att koppla till 
//spelarens rörelse och input.

//För movement:
//Du får tillgång till huruvida en knapp trycks ned genom:
//getAxisRaw("direction").
//skriv "horizontal" i "direction" för att få tillgång till höger/vänster
//och "vertical" för att få tillgång till upp/ned.
//Detta returnar ett float-värde på -1, 0 eller 1.
//EX: Skriver du getAxisRaw("horizontal") och håller ned vänster så kommer den att
//spotta ut ett float-värde på -1, håller du ned höger spottar den ut 1.
//Håller du inte in någonting så får du värdet 0.

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

void keyPressed() {
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

void keyReleased() {
  if (key == CODED) {
    if(keyCode == UP) {
      moveUp = false;
    }
    if(keyCode == DOWN) {
      moveDown = false;
    }
    if(keyCode == LEFT) {
      moveLeft = false;
    }
    if(keyCode == RIGHT) {
      moveRight = false;
    }
  }
  
  if(key == 'z') {
    slowMove = false;
  }
  
  if(key == 'x') {
    shoot = false;
  }
}

float getAxisRaw(String axis) {
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

boolean getButton(String button) {
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
