extends Button

func _ready():
	self.pressed.connect(self._button_pressed)

func _button_pressed():
	self.get_parent().visible = false;
	var game = get_node("/root/Game/GUI")
	game.visible = true;
	game.start()
