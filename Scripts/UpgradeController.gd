extends Node

var upgrades = {
	"autoclicker": {
		"name": "Autoclicker",
		"cost": 10,
		"level": 0,
		"cost_scaling": 1.25,
		"effect": "add_autoclicker"
	},
	"strength": {
		"name": "Strength",
		"cost": 100,
		"level": 0,
		"cost_scaling": 2,
		"effect": "strengthen_click"
	}
}

@onready var score_manager = get_parent().get_node("ScoreManager")


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
		score_manager.add_autoclicker()
	if effect == "strengthen_click":
		score_manager.strengthen_click()
