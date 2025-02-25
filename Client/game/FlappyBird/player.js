class Player{
	constructor(x, y){
		this.x = x;
		this.y = y;
		this.velY = 0;
		this.velX = panSpeed;
		this.size = 40;
		this.dead = false;
		this.isOnGround = false;
		this.deadOnGroundCount = 0;
		this.score = 0;
		this.fallRotation = -PI / 6;
	}

	show(){
		push();
		translate(this.x - this.size / 2 - 8 + birdSprite.width / 2, this.y - this.size / 2 + birdSprite.height / 2);
    	if (this.velY < 2) {
      		rotate(-PI / 6);
      		this.fallRotation = -PI / 6;
    	}else if(this.velY <= 6) {
      		this.fallRotation += PI / 4.0;
      		this.fallRotation = constrain(this.fallRotation, -PI / 2, PI / 4);
      		rotate(this.fallRotation);
    	}else if(this.velY <= 10) {
      		this.fallRotation += PI / 8.0;
      		this.fallRotation = constrain(this.fallRotation, -PI / 6, PI / 2);
      		rotate(this.fallRotation);
    	}else{
      		rotate(PI / 2);
    	}
		image(birdSprite, -birdSprite.width / 2, -birdSprite.height / 2);
		pop();
	}

	update(){
		this.velY += gravity;
		if(this.y-this.size/2 < 0){
			this.y = 0+this.size/2;
			this.velY = 0;
		}else{
			this.velY += gravity;
		}
		

		if(!this.dead){
			this.velY = constrain(this.velY, -1000, 25);
		}else{
			this.velY = constrain(this.velY, -1000, 30);
		}

		if(!this.isOnGround){
			this.y += this.velY;
		}else{
			this.deadOnGroundCount++;
			if(this.deadOnGroundCount==50){
				alert(`Game Over! Điểm lần này của bạn: ${player.score}`);

				var user_name = document.getElementById('user_name').innerHTML;
				var user_score = player.score;
				var game_name = "FlappyBird";

				var ajax = new XMLHttpRequest();
				var method = "GET";
				var url = "./Client/game/Process/php/add_user_score.php?add=score&userName="+user_name+"&gameName="+game_name+"&userScore="+user_score;
				var asynchronous = true;

				ajax.open(method, url, asynchronous);

				ajax.send();

				ajax.onreadystatechange = function(){
					if(this.readyState == 4 && this.status == 200){
						var response = this.responseText;
						// alert(response);
						if(response == "true"){
							alert(`Đã thêm ${user_score} BeUToken vào ví, hãy dùng nó để đổi nhiều voucher độc đáo tại phần đổi thưởng nhé!`);
						}else if(response = "lackofTurn"){
							alert('Bạn đã hết lượt chơi, vui lòng mua hàng để nhận thêm lượt nhé!');
						}else{
							alert('Xảy ra lỗi trong quá trình cập nhật điểm. Vui lòng liên hệ với nhân viên để được trợ giúp!');
						}
						document.body.style.zoom = "100%";
						window.location = "./index.php?quanly=game";
					}
				}
			}
		}

		this.checkCollisions();

		if(pipes.passed(this)){
			this.score++;
		}
		if(pipes2.passed(this)){
			this.score++;
		}
	}

	checkCollisions(){
		if(!this.dead){
			pauseBecauseDead = false;
		}

		if(pipes.colided(this)){
			this.dead = true;
			pauseBecauseDead = true;
		}

		if(pipes2.colided(this)){
			this.dead = true;
			pauseBecauseDead = true;
		}

		if(ground.colided(this)){
			this.dead = true;
			this.isOnGround = true;
			pauseBecauseDead = true;
		}

		if(this.dead && this.velY < 0){
			this.velY = 0;
		}
	}

	flap(){
		if(!this.dead && !this.isOnGround){
			this.velY -= 10;
		}
	}
}