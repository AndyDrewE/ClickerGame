extends Node

var upgrades = {
	"autoclicker": {
		"name": "Autoclicker",
		"cost": 10,
		"level": 0,
		"cost_scaling": 1.25,
		"effect": "add_autoclicker"
	},
	"click_value": {
		"name": "Click Value",
		"cost": 50,
		"level": 1,
		"cost_scaling": 1.5,
		"effect": "add_click_value"
	},
	"multiplier" : {
		"name": "Multiplier",
		"cost": 100,
		"level": 1,
		"cost_scaling": 2,
		"effect": "add_multiplier"
	}
}

var score_manager

func _ready():
	score_manager = GameController.get_score_manager()


func purchase_upgrade(upgrade_id: String):
	var upgrade = upgrades[upgrade_id]
	var cost = upgrade.cost
	
	if score_manager.gold >= cost:
		score_manager.update_gold(-cost)
		upgrade.level += 1
		upgrade.cost = int(cost * upgrade.cost_scaling)
		apply_upgrade_effect(upgrade.effect)
		
func apply_upgrade_effect(effect):
	if effect == "add_autoclicker":
		score_manager.update_autoclick_wait_time()
	elif effect == "add_multiplier":
		score_manager.update_multiplier_factor()
