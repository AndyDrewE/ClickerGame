extends Node

var gold := 0
var num_autoclickers := 10
var click_value := 1

signal gold_changed(new_gold)


#Update gold function, optional argument, default value is click_value
func update_gold(amount := click_value):
	gold += amount
	emit_signal("gold_changed", gold)
	
func add_autoclicker():
	num_autoclickers += 1

#Timer every second to update the autoclicker
func _on_auto_click_timer_timeout():
	update_gold((click_value * num_autoclickers))
