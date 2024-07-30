extends TextureButton

var enabled = true;

func _on_pressed():
	if enabled:
		enabled = false
	else:
		enabled = true
	$SoundCross.visible = not enabled
	var bus_idx = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_mute(bus_idx, not enabled)	
