extends Control

@onready var ui_controller = self.get_parent()

func _on_continue_pressed():
	ui_controller.pause(true)
