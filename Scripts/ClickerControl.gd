extends Control

var gold := 0

@onready var gold_name_label = $GoldLabelBox/GoldNameLabel
@onready var gold_amount_label = $GoldLabelBox/GoldAmountLabel

func _on_Cookie_pressed():
	gold += 1
	print(gold)
	gold_amount_label.text = "%d" % gold
