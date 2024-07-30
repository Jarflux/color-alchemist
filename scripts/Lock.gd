extends TextureButton

var gold
# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(self._button_pressed)
	gold = get_node("/root/Game/GUI/Gold")

func _button_pressed():
	if gold.amount() >= 500:
		$"../../../../AudioManager".play_multiple(["res://sounds/lock-pad-metal-latch-pull-open.mp3","res://sounds/wind-chimes-fast.mp3"])
		gold.decrease(500)
		get_node("/root/Game/GUI/Book/Locked").visible = false
		get_node("/root/Game/GUI/Book/Unlocked").visible = true
	
