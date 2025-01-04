extends Node

var Front_D = 0
var Kami_D = 0

var score = 000000
var highscore = 000000
var timer = 0

var camera = null


func _process(_delta):
	if Input.is_action_pressed("restart"):
		var _reload: bool = get_tree().reload_current_scene()
		score = 000000
		timer = 0
		
