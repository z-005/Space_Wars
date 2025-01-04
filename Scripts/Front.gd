extends KinematicBody2D

# VAR DO FRONT

var BulletF = preload("res://Scenes/Bullets/enemy_b/Bullet_F.tscn")

var player = null
var canshootF = true

onready var PositionBF = $PositionBF
#onready var timerE = $Spawnspeed
onready var explosion = $Explosion
onready var muzzleflash = $Muzle

export var speed = 1.7
export var health = 1

func _physics_process(_delta): # MOVIMENTO COM BASE NA POSIÇÃO DO PLAYER
	var movement = Vector2(0,2)
	if player:
		movement = position.direction_to(player.position) * speed
	movement = move_and_collide(movement)

func _on_Detection_body_entered(body): # SENSOR DE DETECÇÃO DO PLAYER
	if body.is_in_group("Player"):
		player = body
		$Spawnspeed.start()

func _on_Spawnspeed_timeout(): # VELOCIDADE DE TIRO COM BASE NO SENSOR ACIMA
	canshootF = true
	if player != null:
		_shootF()
		

func _shootF(): # FUNÇÃO GERAL DO TIRO
	if canshootF:
		var BFinstance = BulletF.instance()
		BFinstance.position = PositionBF.global_position
		get_tree().current_scene.add_child(BFinstance)
		muzzleflash.play("MuzzleFlash")
#		$Spawnspeed.start()
		canshootF = false
#		explosion.visible = true
		

func enemy_hit(): # DANO DO FRONT
	health -= 1
	if health == 0:
		queue_free()
		Global.Front_D += 1
		Global.score += 150
		
#		print("Front mortos: ", Global.Front_D)

func _on_Area2D_body_entered(body):
	if body.is_in_group("End"):
		queue_free()
	if body.is_in_group("Player"):
		body.player_hit()
		

#DEIXEI DESLIGADO, POIS QUANDO ELE SE ENCOSTA EM OUTRO INIMIGO, SUA COLISÃO SOME
# E NÃO LEVA DANO DO PLAYER, POR NÃO POSSUIR COLISÃO.
func _on_Area2D_area_entered(area):
	if area.is_in_group("enemy"): # ATINGIR O INIMIGO, DAR DANO E EM SEGUIDA SE DESTRUIR
		get_node("CollisionShape2D").set_deferred("disabled", true)
	else:
		get_node("CollisionShape2D").set_deferred("disabled", false)
	if area.is_in_group("Player") or area.is_in_group("bullet_P"): # ATINGIR O INIMIGO, DAR DANO E EM SEGUIDA SE DESTRUIR
		get_node("CollisionShape2D").set_deferred("disabled", false)
