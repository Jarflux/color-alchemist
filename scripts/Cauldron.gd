extends Sprite2D

var default_color = Color(0,0,0,0)
var current_color = null
var color_node

func _ready():
	color_node = $Color

func add_color_to_cauldron(color):
	$"../../AudioManager".play("res://sounds/water-pour-liquid-into-coffee-mug.mp3")
	if current_color==null:
		current_color = color
	else:
		current_color = _mix_colors(current_color, color)
	$"../Sell".update()
	color_node.modulate = current_color["color"]

func contains_color():
	return not current_color==null

func getColor():
	return current_color

func reset():
	color_node.modulate = default_color
	current_color = null
	$"../Sell".update()
	
func _mix_colors(color1, color2):
	var color_code = color1["code"] + color2["code"] #RY + W  -> Light Orange
	var sanitized_color_code = ""
	if color_code.contains("R"):
		sanitized_color_code += "R"
	if color_code.contains("Y"):
		sanitized_color_code += "Y"
	if color_code.contains("B"):
		sanitized_color_code += "B"
	if color_code.contains("W"):
		sanitized_color_code += "W"
	return _find_color_with_code(sanitized_color_code)
	
func _find_color_with_code(color_code):
	for value in get_parent().COLORS:
		if value["code"] == color_code:
			return value
