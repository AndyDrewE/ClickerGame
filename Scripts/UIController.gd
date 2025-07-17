extends Control

@onready var score_manager = get_parent().get_node("ScoreManager")
@onready var upgrade_controller = get_parent().get_node("UpgradeController")

@onready var gold_name_label = $GoldLabelBox/GoldNameLabel
@onready var gold_amount_label = $GoldLabelBox/GoldAmountLabel

#update gold UI
func update_gold_display(new_gold : int):
	gold_amount_label.text = "%d" % new_gold


func _on_Cookie_pressed():
	score_manager.update_gold()
