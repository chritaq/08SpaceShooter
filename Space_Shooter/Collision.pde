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
