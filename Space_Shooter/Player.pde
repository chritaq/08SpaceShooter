class Player extends Ship {
  
  float speed = 5;

  public Player(PVector newPos) {
    super (newPos, new PVector());
  }

  void update() {
    if(alive) {
      createPlayer();
      playerMovement();
      playerShoots();
    }
    updateBullets();
  }
  
  void playerMovement() {
	float moveY = getAxisRaw("Vertical") * speed;
	float moveX = getAxisRaw("Horizontal") * speed;
	position.x = position.x + moveX;
	position.y = position.y + moveY;

	if (position.x < 0) {
		position.x = width;
	}
	else if (position.x > width) {
		position.x = 0;
	}
  }

  void playerShoots() {
  	boolean slow = getButton("z") ;
	boolean shoot = getButton("x");		 
  	
  	if (shoot){
      createBullets("UP");
    }
  }

  void createPlayer() {
  	fill(79,156,228);
	ellipse(position.x, position.y, 40, 40);
	fill (255,10,10);
  }

}
