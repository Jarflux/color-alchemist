extends TextureButton

func _ready():
	disable()

func enable():
	self.modulate = Color(1,1,1)
	self.disabled = false
	
func disable():
	self.modulate = Color(0.5,0.5,0.5)
	self.disabled = true

func update():
	if( $"..".has_active_customer() && $"../Cauldron".contains_color()):
		enable()
	else:
		disable()	
