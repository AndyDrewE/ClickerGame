extends Node2D

@onready var score_manager = get_node("ScoreManager")
@onready var upgrade_controller = get_node("UpgradeController")
@onready var ui_controller = get_node("UIController")

var paused = false

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if !paused:
			##Flip pause bool
			paused = true
			##Turn off Autoclicker cause that's the only part of the game that goes automatically
			score_manager.disable_autoclicker()
			##Turn pause menu on
			ui_controller.pause(paused)
		else:
			paused = false
			##Turn on autoclicker
			score_manager.enable_autoclicker()
			##turn pause menu off
			ui_controller.pause(paused)

func _ready():
	#Connect gold_changed signal to update_gold_display, that way everytime the gold is changed, the ui changes
	score_manager.gold_changed.connect(ui_controller.update_gold_display)


