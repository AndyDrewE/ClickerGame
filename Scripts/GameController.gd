extends Node2D

var paused = false
var pending_load = false

var save_path = "res://clicker_most_recent.save"

func _ready():
	paused = false


func get_score_manager() -> Node:
	return get_tree().current_scene.get_node("ScoreManager")

func get_upgrade_controller() -> Node:
	return get_tree().current_scene.get_node("UpgradeController")

func get_UI_controller() -> Node:
	return get_tree().current_scene.get_node("UIController")

func save_game():
	var score_manager = get_score_manager()
	var upgrades = get_upgrade_controller().upgrades
	var save_data = {
		"gold": score_manager.gold,
		"autoclicker" : upgrades["autoclicker"].level,
		"autoclicker_cost" : upgrades["autoclicker"].cost,
		"click_value" : upgrades["click_value"].level,
		"click_value_cost" : upgrades["click_value"].cost
	}
	
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_string(JSON.stringify(save_data))
	file.close()

func load_game():
	var score_manager = get_score_manager()
	var upgrades = get_upgrade_controller().upgrades
	var ui_controller = get_UI_controller()
	
	if not FileAccess.file_exists(save_path):
		return {}
	var file = FileAccess.open(save_path, FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())
		
	for key in data.keys():
		match key:
			"gold":
				score_manager.gold = data[key]
			"autoclicker_cost":
				upgrades["autoclicker"].cost = data[key]
			"click_value_cost":
				upgrades["click_value"].cost = data[key]
			_:
				if upgrades.has(key):
					upgrades[key].level = data[key]
