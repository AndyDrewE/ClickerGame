extends Node

var gold := 0

@onready var autoclick_timer = $AutoClick_Timer
@onready var ui_controller = get_parent().get_node("UIController")
@onready var upgrade_controller = get_parent().get_node("UpgradeController")


#Update gold function, optional argument, default value is click_value
func update_gold(amount = upgrade_controller.upgrades["click_value"].level):
	gold += amount
	ui_controller.update_gold_display(gold)
	
func update_autoclick_wait_time():
	autoclick_timer.wait_time = 1.0/upgrade_controller.upgrades["autoclicker"].level

func enable_autoclicker():
	autoclick_timer.start()

func disable_autoclicker():
	autoclick_timer.stop()

#Timer every second to update the autoclicker
func _on_auto_click_timer_timeout():
	if upgrade_controller.upgrades["autoclicker"].level > 0:
		update_gold(upgrade_controller.upgrades["click_value"].level)
