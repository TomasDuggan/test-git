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

func print_roll() -> void:
	var caster_info := "Caster: [color='green']%s[/color]" % caster._config.display_name
	var skill_info := "Skill: [color='blue']%s[/color]" % skill.display_name
	var dice_info := "Dice amount: [color='yellow']%s[/color]. Dice size: [color='yellow']%s[/color]" % [skill.dice_config.amount_of_dice, skill.dice_config.die_size]
	var rolls_info := "Rolls: [color='purple']%s[/color]" % [str(dice_result.rolls)]
	var rolls_result_info := "Total: [color='purple']%s[/color]" % dice_result.total
	var outcome_info := "Outcome type: [color='purple']%s[/color]" % EnumsHelper.enum_to_string(RollInterpreterSystem.RollOutcomeType, outcome_type)
	var targets_info := "Targets: [color='red']%s[/color]" % [str(targets.map(func(t: Character): return t._config.display_name))]
	
	print(" ------------------- ROLL LANZADO ------------------- ")
	print_rich(
		caster_info + "\n" +
		skill_info + "\n" +
		dice_info + "\n" +
		rolls_info + "\n" +
		rolls_result_info + "\n" +
		outcome_info + "\n" +
		targets_info
	)
	print(" ------------------- /ROLL LANZADO ------------------- ")
