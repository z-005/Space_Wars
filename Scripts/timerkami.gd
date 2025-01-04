extends Timer

var minTime = 1
var maxTime = 3

func _ready():
	spawntimerK()
	var _connect = connect("timeout", self, "spawntimerK")

func _process(_delta):
	if Global.Kami_D == 999:
		queue_free()

func spawntimerK():
	set_wait_time(rand_range(minTime, maxTime))
