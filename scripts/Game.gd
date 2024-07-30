extends Control

class_name Game

var level = 1
var target_color

var target
var flasks
var cauldron
var customer
var gold
var white_enabled = false
var customerRequestActive = false

func _ready():
	flasks = $Flasks
	target = $Target
	cauldron = $Cauldron
	customer = $Customer/CustomerText
	gold = $Gold
	
	$Save.pressed.connect(self._save_color)
	$Reset.pressed.connect(self._reset_cauldron)
	$Sell.pressed.connect(self._sell_flask)

func start():
	flasks.add_flask(COLORS[0])
	flasks.add_flask(COLORS[1])
	flasks.add_flask(COLORS[2])
	
func _sell_flask():
	if cauldron.getColor()["code"] == target_color["code"]:
		customer.newline()
		customer.append_text("[color=darkgreen]This elixir is exactly what I'm looking for.[/color]")
		gold.increase(100)
		customerRequestActive = false
		$Sell.update()
		_reset_cauldron()
	else:
		customer.newline()
		customer.append_text("[color=darkred]This potion does not have the desired effect I did hope for. Do you have another?[/color]")

func enable_white():
	white_enabled = true
	flasks.add_flask(COLORS[3])

func has_active_customer():
	return customerRequestActive

func _on_new_customer_pressed():
	$"../AudioManager".play("res://sounds/bell-1.mp3")
	customerRequestActive = true
	$Sell.update()
	var target_color_index
	if white_enabled:
		target_color_index = randi_range(0,COLORS.size()-1)
		target_color = COLORS[target_color_index]
	else: 	
		var temp = COLORS.filter(func(color): if not color['code'].contains("W"): return color)
		target_color_index = randi_range(0,temp.size()-1)
		target_color = temp[target_color_index]
	target.modulate = target_color["color"]
	customer.clear()
	customer.append_text("[color=black]" + target_color["customerRequests"][randi_range(0,1)] + "[/color]")

func _save_color():
	if cauldron.getColor()!=null:
		flasks.add_flask(cauldron.getColor())
	
func _reset_cauldron():	
	cauldron.reset()

const COLORS = [
		{
		"name": "Red",
		"code": "R",
		"color": Color.RED,
		"customerRequests": [
			"Pray, may I acquire the elixir that grants the power of a raging fire?",
			"I seek a draught that emboldens one's heart with fiery courage."
		]
	},
	{
		"name": "Yellow",
		"code": "Y",
		"color": Color.YELLOW,
		"customerRequests": [
			"Might I procure a potion that brings sunlight to the darkest places?",
			"Could you give me the elixir that shines with the light of a thousand suns?"
		]
	},
	{
		"name": "Blue",
		"code": "B",
		"color": Color.BLUE,
		"customerRequests": [
			"Could you brew me a tincture that waters my plants while I’m on holiday?",
			"May I have the brew that brings  me the calmness of the deep sea?"
		]
	},
	{
		"name": "White",
		"code": "W",
		"color": Color.FLORAL_WHITE,
		"customerRequests": [
			"Could you provide a draught that purifies all it touches?",
			"I desire the elixir that shines with the purity of fresh snow."
		]
	},
	{
		"name": "Orange",
		"code": "RY",
		"color": Color.ORANGE,
		"customerRequests": [
			"Might I obtain the brew that ignites the warmth of a summer sunset?",
			"May I have the elixir that emboldens one's spirit with autumn's fire?"
		]
	},
	{
		"name": "Purple",
		"code": "RB",
		"color": Color.PURPLE,
		"customerRequests": [
			"I desire a concoction that connects me to mystical energies.",
			"May I acquire the draught that opens the gates to arcane wisdom?"
		]
	},
	{
		"name": "Pink",
		"code": "RW",
		"color": Color.PINK,
		"customerRequests": [
			"Couldst thou bestow upon me the cordial that spreads love and joy?",
			"I seek a draught that surrounds one with a glow of affection."
		]
	},
	{
		"name": "Green",
		"code": "YB",
		"color": Color.GREEN,
		"customerRequests": [
			"Might I have a mixture that rejuvenates the nature around me?",
			"Could you provide an elixir that breathes life into withered leaves?"
		]
	},
	{
		"name": "Light Yellow",
		"code": "YW",
		"color": Color.LIGHT_YELLOW,
		"customerRequests": [
			"I seek an elixir that brightens the mood like a gentle morning sun?",
			"I desire a tincture that glows like the first light of dawn?"
		]
	},
	{
		"name": "Light Blue",
		"code": "BW",
		"color": Color.LIGHT_BLUE,
		"customerRequests": [
			"May I acquire a brew that soothes like a gentle breeze?",
			"Could you provide an elixir that calms the mind like clear ice?"
		]
	},
	{
		"name": "Brown",
		"code": "RYB",
		"color": Color.SADDLE_BROWN,
		"customerRequests": [
			"Might I purchase a tincture that brings the earthy comfort of a forest floor?",
			"Could you provide me with a brew that grounds the spirit like fertile soil?"
		]
	},
	{
		"name": "Light Orange",
		"code": "RYW",
		"color": Color(1, 0.75, 0.5),
		"customerRequests": [
			"Could I acquire a potion that enhances my optimism like a bright autumn leaf?",
			"May I have the elixir that glows with the light of the harvest moon?"
		]
	},
	{
		"name": "Light Purple",
		"code": "RBW",
		"color": Color(0.75, 0.5, 1),
		"customerRequests": [
			"I desire a concoction that creates a minor connection to mystical energies.",
			"I seek a potion that brings me the tranquility of a lavender field."
		]
	},
	{
		"name": "Light Green",
		"code": "YBW",
		"color": Color(0.564706, 0.933333, 0.564706, 1),
		"customerRequests": [
			"May I acquire a brew that rejuvenates the weary spirit like fresh dew?",
			"Might I obtain the elixir that brings the renewal of a spring morning?"
		]
	},
	{
		"name": "Light Brown",
		"code": "RYBW",
		"color": Color(0.8, 0.7, 0.5),
		"customerRequests": [
			"May I purchase a minor brew to harden my skin like bark",
			"Could you provide a minor elixir of fertile soil?"
		]
	}
]



