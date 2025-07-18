extends Control

@onready var score_manager = get_parent().get_node("ScoreManager")
@onready var upgrade_controller = get_parent().get_node("UpgradeController")

@onready var gold_name_label = $GoldLabelBox/GoldNameLabel
@onready var gold_amount_label = $GoldLabelBox/GoldAmountLabel

#autoclicker upgrade labels
@onready var num_clicker_label = $UpgradePanel/AutoclickerBox/NumClicker
@onready var clicker_cost = $UpgradePanel/AutoclickerBox/Cost
#strength upgrade labels
@onready var strength_level = $UpgradePanel/StrengthenBox/StrengthLevel
@onready var strength_cost = $UpgradePanel/StrengthenBox/Cost

func _ready():
	update_autoclicker_UI(upgrade_controller.upgrades["autoclicker"].level, upgrade_controller.upgrades["autoclicker"].cost)
	update_strength_UI(upgrade_controller.upgrades["strength"].level, upgrade_controller.upgrades["strength"].cost)
	
#update gold UI
func update_gold_display(new_gold : int):
	gold_amount_label.text = "%d" % new_gold

#update autoclicker upgrade UI
func update_autoclicker_UI(num_clicker: int, new_cost: int):
	num_clicker_label.text = "%d" % num_clicker
	clicker_cost.text = "%d" % new_cost

func update_strength_UI(level: int, new_cost: int):
	strength_level.text = "%d" % level
	strength_cost.text = "%d" % new_cost

func _on_Cookie_pressed():
	score_manager.update_gold()


func _on_autoclicker_button_pressed():
	# Purchase auto clicker upgrade
	upgrade_controller.purchase_upgrade("autoclicker")
	#update autoclicker button UI
	update_autoclicker_UI(upgrade_controller.upgrades["autoclicker"].level, upgrade_controller.upgrades["autoclicker"].cost)
	




func _on_strengthen_button_pressed():
	# Purchase strength upgrade
	upgrade_controller.purchase_upgrade("strength")
	#update strength button UI
	update_strength_UI(upgrade_controller.upgrades["strength"].level, upgrade_controller.upgrades["strength"].cost)
	
