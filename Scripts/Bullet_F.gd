extends Area2D

var speed = 300

func _physics_process(delta):
	position.y += delta * speed  # MOVIMENTO DA BALA


func _on_Bullet_F_body_entered(body): # BALA APAGA QUANDO ATINGE A PAREDE OU UMA BALA DO PLAYER
	if body.is_in_group("Wall") or body.is_in_group("bullet_P") or body.is_in_group("barreira"): 
		queue_free()
	
	
	
		
	if body.has_method("player_hit"): # ATINGIR O PLAYER DAR DANO E APAGAR EM SEGUIDA
		body.player_hit()
		queue_free()


func _on_Despawntimer_timeout(): # QUANDO O TEMPORIZADOR TERMINA, ELE SE APAGA
	queue_free()


func _on_Bullet_F_area_entered(area):
	if area.has_method("enemy_hit"): # ATINGIR O INIMIGO, DAR DANO E EM SEGUIDA SE DESTRUIR
		area.enemy_hit()
		queue_free()
