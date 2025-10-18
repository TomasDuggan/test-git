extends Object
class_name SkillCastContext
"""
DTO para el contexto del casteo de un Skill
"""

var all_characters: Array[Character]
var caster: Character
var custom_target: Character
var skill: SkillConfig
var dice_result: DiceResult
var outcome_type: RollInterpreterSystem.RollOutcomeType


func _init(all_characters_arg: Array[Character], caster_arg: Character, custom_target_arg: Character, skill_arg: SkillConfig) -> void:
	all_characters = all_characters_arg
	caster = caster_arg
	custom_target = custom_target_arg
	skill = skill_arg

func print_roll() -> void:
	var caster_info := "Caster: [color='green']%s[/color]" % caster._config.display_name
	var skill_info := "Skill: [color='blue']%s[/color]" % skill.display_name
	var dice_info := "Dice amount: [color='yellow']%s[/color]. Dice size: [color='yellow']%s[/color]" % [skill.dice_config.amount_of_dice, skill.dice_config.die_size]
	var rolls_info := "Rolls: [color='purple']%s[/color]" % [str(dice_result.rolls)]
	var rolls_result_info := "Total: [color='purple']%s[/color]" % dice_result.total
	var outcome_info := "Outcome type: [color='purple']%s[/color]" % EnumsHelper.enum_to_string(RollInterpreterSystem.RollOutcomeType, outcome_type)
	var targets_info := "Targets: [color='red']%s[/color]" % custom_target._config.display_name if custom_target != null else "NO CUSTOM TARGET"
	
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
