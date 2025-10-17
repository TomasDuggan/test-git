extends Resource
class_name DiceConfig

@export var amount_of_dice: int
@export var die_size: int
@export var thresholds: Dictionary[RollInterpreterSystem.RollOutcomeType, int] = {
	RollInterpreterSystem.RollOutcomeType.FAIL: 0,
	RollInterpreterSystem.RollOutcomeType.PARTIAL: 0,
}
