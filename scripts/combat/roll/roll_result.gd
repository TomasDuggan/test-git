extends Object
class_name RollResult


var caster: Character
var targets: Array[Character]
var skill: SkillConfig
var dice_result: DiceResult
var outcome_type: RollInterpreterSystem.RollOutcomeType

func _init(caster_arg: Character, targets_arg: Array[Character], skill_arg: SkillConfig) -> void:
	caster = caster_arg
	targets = targets_arg
	skill = skill_arg
