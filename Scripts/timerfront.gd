extends Timer

var minTime = 1
var maxTime = 2

func _ready(): # QUANDO COMEÇAR, ELE SE CONECTA COM A FUNÇÃO LOCAL NO CÓDIGO
	spawntimeF()
	var _connectFront = connect("timeout", self, "spawntimeF")

func _process(_delta):
	if Global.Front_D == 999:
		queue_free()

func spawntimeF():
	set_wait_time(rand_range(minTime, maxTime)) # RANDOMIZADOR ALEATÓRIO DO TIMER

