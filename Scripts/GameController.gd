extends Node2D

@onready var main = get_tree().current_scene
@onready var score_manager = main.get_node("ScoreManager")
@onready var ui_controller = main.get_node("UIController")
@onready var upgrade_controller = main.get_node("UpgradeController")

var paused = false

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		ui_controller.toggle_pause()

func _ready():
	#Connect gold_changed signal to update_gold_display, that way everytime the gold is changed, the ui changes
	score_manager.gold_changed.connect(ui_controller.update_gold_display)


