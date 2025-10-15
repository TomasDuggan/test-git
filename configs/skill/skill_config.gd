extends Resource
class_name SkillConfig

@export_category("UI")
@export var display_name: String
@export var desc: String
@export var icon: Texture2D

@export_category("Logic")
@export var amount_of_dice: int
@export var die_size: int
@export var affects_enemies: bool
@export var amount_of_targets: int
@export var thresholds: Dictionary[RollInterpreterSystem.RollOutcomeType, int] = {
	RollInterpreterSystem.RollOutcomeType.FAIL: 0,
	RollInterpreterSystem.RollOutcomeType.PARTIAL: 0,
}
