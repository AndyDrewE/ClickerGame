extends Node

var audio_stream_player

func _ready() -> void:
	audio_stream_player = $AudioStreamPlayer
	var buttons : Array = get_tree().get_nodes_in_group("Button")
	for inst in buttons:
		inst.connect("pressed", on_button_pressed)
		
func on_button_pressed() -> void:
	audio_stream_player.play()
