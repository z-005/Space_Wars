extends Node2D

var Front = preload("res://Scenes/Enemies/Front.tscn") # CARREGA A NAVE FRONT
var Kami = preload("res://Scenes/Enemies/Kami.tscn")
#var Boss = preload("res://Scenes/Boss.tscn")
onready var path_Kami = $Path_Kami
onready var player = $Player



func _process(_delta):

	
	if Global.score > Global.highscore:
		Global.highscore = Global.score

func _on_SpawnFront_timeout(): # SPAWNER COM POSIÇÃO ALEATÓRIA
	var front = Front.instance()
	front.position = Vector2(rand_range(10,290), rand_range(1, 1))
	front.position = Vector2(rand_range(40,150), rand_range(1, 1))
	front.position = Vector2(rand_range(120,180), rand_range(1, 1))
	front.position = Vector2(rand_range(70,200), rand_range(1, 1))
	add_child(front)
	

func _on_SpawnKami_timeout():
	var kami = Kami.instance()
	kami.position = Vector2(rand_range(10,290), rand_range(1, 1))
	kami.position = Vector2(rand_range(40,210), rand_range(1, 1))
	kami.position = Vector2(rand_range(90,130), rand_range(1, 1))
	add_child(kami)

#func _on_SpawnBoss_timeout(): # QUANDO MEXER NO BOSS CONECTAR
#	if Global.Front_D == 50 and Global.Kami_D == 50:
	#	var boss = Boss.instance()
	#	boss.position = Vector2(160,50)
	#	add_child(boss)
