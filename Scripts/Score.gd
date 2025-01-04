extends Control

onready var _score = $Score
onready var _HighScore = $HighScore
var total_time_in_secs : int = 0


#onready var timer_ = get_node("Time")
#onready var timer = get_node("Timer")


func _process(_delta):
	
	_score.text = str(Global.score)
	_HighScore.text = str(Global.highscore)
	

func _ready():
	# start Timer at specific time:
	# (or use 'Autostart' property)
	$Timer.start()


func _on_Timer_timeout():
	total_time_in_secs += 1
	var m = int(total_time_in_secs / 60.0)
	var s = total_time_in_secs - m * 60
	$time.text = '%02d:%02d' % [m, s]
