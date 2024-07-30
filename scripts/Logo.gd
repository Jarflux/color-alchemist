extends Sprite2D

var color_cycle_speed: float = 0.1
var time: float = 0.0

func _process(delta):
	time += delta * color_cycle_speed
	var hue: float = time / 1.0  
	var color: Color = Color.from_hsv(hue, 1.0, 1.0)  
	modulate = color

