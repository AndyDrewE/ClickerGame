extends Node

var gold := 0
var click_value := 1

signal gold_changed(new_gold)

func update_gold():
	gold += click_value
	emit_signal("gold_changed", gold)
