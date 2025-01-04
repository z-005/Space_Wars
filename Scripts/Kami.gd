extends KinematicBody2D

export var speed = 2

var health = 1

func _physics_process(_delta):
	var movement = Vector2(0,2)
	
	movement = movement * speed
	
	movement = move_and_collide(movement)


func _on_Area2D_body_entered(body):
	if body.is_in_group("Bullet_P"):
		enemy_hit()
		
	
	if body.is_in_group("End"):
		queue_free()
	
	if body.is_in_group("Player"):
		body.KAMI_IS_COLLIDING()


func enemy_hit():
	health -= 1
	if health == 0:
			queue_free()
			Global.Kami_D += 1
			Global.score += 100
#			print("Kami's mortos: ", Global.Kami_D)

#DEIXEI DESLIGADO, POIS QUANDO ELE SE ENCOSTA EM OUTRO INIMIGO, SUA COLISÃO SOME
# E NÃO LEVA DANO DO PLAYER, POR NÃO POSSUIR COLISÃO.
func _on_Area2D_area_entered(area):
	if area.is_in_group("enemy"): # ATINGIR O INIMIGO, DAR DANO E EM SEGUIDA SE DESTRUIR
		get_node("CollisionShape2D").set_deferred("disabled", true)
	if area.is_in_group("Player"): # ATINGIR O INIMIGO, DAR DANO E EM SEGUIDA SE DESTRUIR
		get_node("CollisionShape2D").set_deferred("disabled", false)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
