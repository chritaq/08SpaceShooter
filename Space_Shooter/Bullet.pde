class Bullet extends GameObject {


	public Bullet(PVector newPos, PVector newVel) {
		super(newPos, newVel);
		size = 5;
	}

	void update() {
    if(alive) {
      super.updatePosWithVel();
      ellipse(position.x, position.y, size, size);
    }
		

	}

}
