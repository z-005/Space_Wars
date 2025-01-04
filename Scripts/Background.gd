extends ParallaxBackground


var vel = 100

func _process(delta):
	scroll_offset.y +=  vel * delta 
	
	

