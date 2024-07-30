extends HBoxContainer

var flaskPrefab = preload("res://scenes/Flask.tscn")

var amount_of_flasks = 0
var max_amount_of_flasks = 10

func add_flask(color):
	if amount_of_flasks < max_amount_of_flasks:
		amount_of_flasks = amount_of_flasks + 1
		var newFlask = flaskPrefab.instantiate()
		newFlask.set_color(color)
		self.add_child(newFlask)
		newFlask.visible = true	
