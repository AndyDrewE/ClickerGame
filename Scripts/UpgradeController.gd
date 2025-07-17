extends Node

var upgrades = {
	"autoclicker": {
		"name": "Autoclicker",
		"cost": 10,
		"level": 0,
		"effect": "add_autoclicker"
	}
}

@onready var score_manager = get_parent().get_node("ScoreManager")


func purchase_upgrade(upgrade_id: String):
	var upgrade = upgrades[upgrade_id]
	var cost = upgrade.cost
	
	if score_manager.gold >= cost:
		score_manager.update_gold(-cost)
		upgrade.level += 1
		upgrade.cost = int(cost * 1.5)
		apply_upgrade_effect(upgrade.effect)
		
func apply_upgrade_effect(effect):
	if effect == "add_autoclicker":
		score_manager.add_autoclicker()
