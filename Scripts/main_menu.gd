extends Control

var sound_manager 

func _ready():
	sound_manager = GameController.get_sound_manager()


func _on_start_pressed():
	await sound_manager.click_sound.finished
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_exit_pressed():
	await sound_manager.click_sound.finished
	get_tree().quit()


func _on_load_game_pressed():
	await sound_manager.click_sound.finished
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	GameController.pending_load = true
