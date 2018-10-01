class Bullet {

	PVector position;
	PVector velocity;

	public Bullet(PVector newPos, PVector newVel) {
		position = newPos;
		velocity = newVel;
		

	}

	void update() {
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
