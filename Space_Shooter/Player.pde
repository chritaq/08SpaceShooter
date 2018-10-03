class Player extends Ship {
  
  float speed = 5;

  public Player(PVector newPos) {
    super (newPos, new PVector());
  }

  void update() {
  	createPlayer();
	playerMovement();
	playerShoots();
	
  }
  
  void playerMovement() {
	float moveY = getAxisRaw("Vertical") * speed;
	float moveX = getAxisRaw("Horizontal") * speed;
	position.x = position.x + moveX;
	position.y = position.y + moveY;
	}

  void playerShoots() {
  	boolean slow = getButton("z") ;
	boolean shoot = getButton("x");		 
  	
  	if (shoot){
      createBullets("UP");
    }
  	updateBullets();
  }

  void createPlayer() {
  	fill(79,156,228);
	ellipse(position.x, position.y, 40, 40);
	fill (255,10,10);
  }

}
