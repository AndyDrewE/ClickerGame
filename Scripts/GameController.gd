extends Node2D

var gold := 0

@onready var gold_name_label = $ClickerControl/GoldLabelBox/GoldNameLabel
@onready var gold_amount_label = $ClickerControl/GoldLabelBox/GoldAmountLabel

func _on_Cookie_pressed():
	gold += 1
	gold_amount_label.text = "%d" % gold
