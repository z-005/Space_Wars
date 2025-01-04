extends Area2D

var speed = 300

func _physics_process(delta): # MOVIMENTO DA BALA 
	position.y -= delta * speed 

func _on_bullet_1_body_entered(body): # SE APAGAR QUANDO ENTRAR EM CONTATO COM A PAREDE
	if body.is_in_group("Wall"):
		queue_free()
		
	if body.is_in_group("enemy") or body.is_in_group("KAMI"): # ATINGIR O INIMIGO, DAR DANO E EM SEGUIDA SE DESTRUIR
		body.enemy_hit()
		queue_free()
		


func _on_Despawntimer_timeout(): # QUANDO O TEMPORIZADOR TERMINA, ELE SE APAGA
	queue_free()


