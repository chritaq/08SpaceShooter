class Player extends Ship {
  float speed;
  float startSpeed = 5;
  float slowSpeed = startSpeed/2;

  public Player(PVector newPos) {
    super (newPos, new PVector());
    firingRate = 5;
    bulletSpeed = 10;
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
  	PVector move = new PVector();
	move.y = getAxisRaw("Vertical") * speed;
	move.x = getAxisRaw("Horizontal") * speed;
	position.x = position.x + move.x;
	position.y = position.y + move.y;
	move.normalize();
	boolean slow = getButton("z");
	if (slow) {
		speed = slowSpeed;
	}
	else if (!slow) {
		speed = startSpeed;
	}

	if (position.x < 0) {
		position.x = 0;
	}
	else if (position.x > width) {
		position.x = width;
	}
	else if (position.y < 0) {
		position.y = 0;
	}
	else if (position.y > height) {
		position.y = height;
	}
  }

  void playerShoots() {
	boolean shoot = getButton("x");		 
  	
  	if (shoot){
      createBullets("UP", "Player");
    }
  }

  void createPlayer() {
  	fill(79,156,228);
	ellipse(position.x, position.y, 40, 40);
	fill (255,10,10);
  }

}
