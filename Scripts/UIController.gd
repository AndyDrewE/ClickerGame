extends Control

var score_manager
var upgrade_controller

@onready var pause_menu = get_node("Pause_Menu")

#Gold name and labels
@onready var gold_name_label = $GoldLabelBox/GoldNameLabel
@onready var gold_amount_label = $GoldLabelBox/GoldAmountLabel

#autoclicker upgrade labels
@onready var num_clicker_label = $UpgradePanel/AutoclickerBox/NumClicker
@onready var clicker_cost = $UpgradePanel/AutoclickerBox/Cost
#strength upgrade labels
@onready var click_value_level = $UpgradePanel/ClickValueBox/ClickValue
@onready var click_value_cost = $UpgradePanel/ClickValueBox/Cost

func _ready():
	score_manager = GameController.get_score_manager()
	upgrade_controller = GameController.get_upgrade_controller()
	refresh_UI()

func refresh_UI():
	update_gold_display(score_manager.gold)
	update_autoclicker_UI(upgrade_controller.upgrades["autoclicker"].level, upgrade_controller.upgrades["autoclicker"].cost)
	update_click_value_UI(upgrade_controller.upgrades["click_value"].level, upgrade_controller.upgrades["click_value"].cost)

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if get_tree().current_scene.name == "Main":
			toggle_pause()

#update gold UI
func update_gold_display(new_gold : int):
	gold_amount_label.text = "%d" % new_gold

#update autoclicker upgrade UI
func update_autoclicker_UI(num_clicker: int, new_cost: int):
	num_clicker_label.text = "%d" % num_clicker
	clicker_cost.text = "%d" % new_cost

func update_click_value_UI(level: int, new_cost: int):
	click_value_level.text = "%d" % level
	click_value_cost.text = "%d" % new_cost

func toggle_pause():
	GameController.paused = !GameController.paused
	pause_menu.visible = GameController.paused
	if GameController.paused:
		score_manager.disable_autoclicker()
	else:
		score_manager.enable_autoclicker()

func go_to_start():
	GameController.paused = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_Cookie_pressed():
	score_manager.update_gold()
	

#There's probably a way to do this better
func _on_autoclicker_button_pressed():
	# Purchase auto clicker upgrade
	upgrade_controller.purchase_upgrade("autoclicker")
	#update autoclicker button UI
	update_autoclicker_UI(upgrade_controller.upgrades["autoclicker"].level, upgrade_controller.upgrades["autoclicker"].cost)

func _on_strengthen_button_pressed():
	# Purchase click_value upgrade
	upgrade_controller.purchase_upgrade("click_value")
	#update click_value button UI
	update_click_value_UI(upgrade_controller.upgrades["click_value"].level, upgrade_controller.upgrades["click_value"].cost)
	
