extends Control

@onready var ui_controller = self.get_parent()

func _on_continue_pressed():
	ui_controller.toggle_pause()


func _on_start_pressed():
	ui_controller.go_to_start()


func _on_exit_pressed():
	get_tree().quit()

