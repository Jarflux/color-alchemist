extends Button

var flask_color

func _ready():
	self.pressed.connect(self._button_pressed)
	
func set_color(color):
	flask_color = color
	self.get_node("Fluid").modulate = flask_color["color"];
	
func _button_pressed():
	get_node("/root/Game/GUI/Cauldron").add_color_to_cauldron(flask_color)

func _on_mouse_entered():
	get_node("/root/Game/AudioManager").play("res://sounds/glass-bottles-clank.mp3")
	$EmptyFlask/FlasksAnimationPlayer.play("rotate_flask_on_hover")

func _on_mouse_exited():
	$EmptyFlask/FlasksAnimationPlayer.play_backwards("rotate_flask_on_hover")
