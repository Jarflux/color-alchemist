extends TextureButton

var game
# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(self._button_pressed)
	game = get_node("/root/Game/GUI")

func _button_pressed():
	$WhiteFlaskToFlasks.play("white_flask_to_flasks")

func _on_white_flask_to_flasks_animation_finished(anim_name):
	self.visible = false
	get_node("/root/Game/GUI/Book/Unlocked").self_modulate = Color(1,1,1,1)
	game.enable_white()
	get_node("/root/Game/AudioManager").play("res://sounds/glass-clink-two-glasses.mp3")
