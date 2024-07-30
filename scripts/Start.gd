extends Button

func _ready():
	self.pressed.connect(self._button_pressed)

func _button_pressed():
	self.get_parent().visible = false;
	var lore = $"../../Lore"
	lore.visible = true;
	$"../../AudioManager".play("res://sounds/paper-crumple-short.mp3")
	

