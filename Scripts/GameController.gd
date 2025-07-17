extends Node2D


func _ready():
	$ScoreManager.gold_changed.connect($UIController.update_gold_display)
