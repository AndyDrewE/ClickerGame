extends Node2D


func _ready():
	#Connect gold_changed signal to update_gold_display, that way everytime the gold is changed, the ui changes
	$ScoreManager.gold_changed.connect($UIController.update_gold_display)
