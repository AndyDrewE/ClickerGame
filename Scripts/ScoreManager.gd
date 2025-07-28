extends Node

var gold := 0

var autoclick_timer
var ui_controller
var upgrade_controller
var multiplier_factor = 1

func _ready():
	autoclick_timer = $AutoClick_Timer
	ui_controller = GameController.get_UI_controller()
	upgrade_controller = GameController.get_upgrade_controller()

#Update gold function, optional argument, default value is click_value
func update_gold(amount = upgrade_controller.upgrades["click_value"].level * multiplier_factor):
	gold += amount
	ui_controller.update_gold_display(gold)
	
func update_autoclick_wait_time():
	autoclick_timer.wait_time = 1.0/upgrade_controller.upgrades["autoclicker"].level

func update_multiplier_factor():
	multiplier_factor = upgrade_controller.upgrades["multiplier"].level

func enable_autoclicker():
	autoclick_timer.start()

func disable_autoclicker():
	autoclick_timer.stop()

#Timer every second to update the autoclicker
func _on_auto_click_timer_timeout():
	if upgrade_controller.upgrades["autoclicker"].level > 0:
		update_gold(upgrade_controller.upgrades["click_value"].level * multiplier_factor)


func _on_main_tree_entered():
	if GameController.pending_load:
		GameController.load_game()
