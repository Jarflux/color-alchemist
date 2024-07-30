extends Label

var current_amount = 0

func _ready():
	self.text = str(current_amount)

func amount():
	return current_amount
	
func increase(amount):
	get_node("/root/Game/AudioManager").play("res://sounds/cash-register-open-ding.mp3")
	current_amount += amount
	self.text = str(current_amount)

func decrease(amount):
	current_amount -= amount
	self.text = str(current_amount)
