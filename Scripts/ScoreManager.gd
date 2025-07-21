extends Node

var gold := 0
var num_autoclickers := 0
var click_value := 1

@onready var autoclick_timer = $AutoClick_Timer

signal gold_changed(new_gold)


#Update gold function, optional argument, default value is click_value
func update_gold(amount := click_value):
	gold += amount
	emit_signal("gold_changed", gold)
	
func add_autoclicker():
	num_autoclickers += 1
	autoclick_timer.wait_time = 1.0/num_autoclickers

func strengthen_click():
	click_value *= 2

func enable_autoclicker():
	autoclick_timer.start()

func disable_autoclicker():
	autoclick_timer.stop()

#Timer every second to update the autoclicker
func _on_auto_click_timer_timeout():
	if num_autoclickers > 0:
		update_gold(click_value)
