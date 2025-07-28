extends Node

var click_sound

func _ready() -> void:
	click_sound = $click_sound
	var buttons : Array = get_tree().get_nodes_in_group("Button")
	for inst in buttons:
		inst.connect("pressed", on_button_pressed)
		
func on_button_pressed() -> void:
	click_sound.play()
	
