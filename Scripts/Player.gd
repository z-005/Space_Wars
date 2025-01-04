extends KinematicBody2D

# VAR DO PLAYER
var bullet_1 = preload("res://Scenes/Bullets/player_b/bullet_1.tscn")

onready var sprite = $Sprite
onready var spawnpos = $SpawnPos
onready var timer = $ShootSpeed
onready var muzle = $muzle
onready var Anim = $Anim
onready var Timer_morte = $timer_morte

var canshoot = true
var speed = 150
var DANO = false

var health = 5
var Kami_is_Colliding = false

func _physics_process(_delta):
	
	var velocity = Vector2.ZERO
	
	#MOVIMENTAÇÃO + TROCA DE FRAMES
	if Input.is_action_pressed("ui_up"):
		sprite.frame = 2
		velocity.y -= speed
	if Input.is_action_pressed("ui_down"):
		sprite.frame = 3
		velocity.y += speed
	if Input.is_action_pressed("ui_left"):
		sprite.frame = 1
		sprite.flip_h = true
		velocity.x -= speed 
	if Input.is_action_pressed("ui_right"):
		sprite.frame = 1
		sprite.flip_h = false
		velocity.x += speed
	
	# TROCA DE FRAMES PARA O IDLE
	if Input.is_action_just_released("ui_left") or Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_down") or Input.is_action_just_released("ui_up"):
		sprite.frame = 0
	
	velocity = move_and_slide(velocity, Vector2())
	

func _on_ShootSpeed_timeout(): # QUANDO O TEMPO TERMINA PODE ATIRAR
	canshoot = true

func _process(_delta): 
#	print("saude: ", health)
	if Input.is_action_pressed("Shoot_1") and canshoot: # PROCESSO DO TIRO
		_shoot()
		

func _shoot(): # FUNÇÃO DO TIRO
	var Binstace = bullet_1.instance()
	Binstace.position = spawnpos.global_position
	get_tree().current_scene.add_child(Binstace)
	timer.start()
	canshoot = false
	muzle.play("Muzleflash")
	

func KAMI_IS_COLLIDING():
	health = 0 
	if health == 0:
		speed = 0
		queue_free()
		Global.score = 0
		var _reload: bool = get_tree().reload_current_scene()
		if Input.is_action_just_pressed("Shoot_1"):
			canshoot = false

func player_hit(): # FUNÇÃO DO DANO LEVADO
	
	health -= 1
#	sprite.frame = 4
	Anim.play("Hit")
	Global.camera._shake(1,2)
	if health == 0:
		Anim.play("Explosion")
	
func _on_hit_player_body_entered(body):   # SÓ LEVA DANO SE O PLAYER ENTRAR
	if body.is_in_group("bullet_e") or body.is_in_group("enemy"):
		player_hit()
		
	if body.is_in_group("KAMI"):
		KAMI_IS_COLLIDING()

func _on_Anim_animation_finished(anim_name):
	if anim_name == "Explosion":
		queue_free()
		Global.score = 0
		var _reload: bool = get_tree().reload_current_scene()
		if Input.is_action_just_pressed("Shoot_1"):
			canshoot = false


