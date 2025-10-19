extends Node
class_name CombatManager
"""
Coordinador de logica de combate
"""

var _all_characters: Array[Character]
var _current_character: Character
var _current_custom_target: Character
var _current_skill: SkillConfig


func _ready():
	CombatEventBus.combat_started.connect(_on_combat_started)
	CombatEventBus.turn_started.connect(_on_turn_started)
	CombatEventBus.skill_selected.connect(_on_skill_selected)
	CombatEventBus.character_selected.connect(_on_character_selected)
	CombatEventBus.roll_pressed.connect(_roll_pressed)

func _on_combat_started(all_characters: Array[Character]) -> void:
	_all_characters = all_characters

func _on_turn_started(character: Character) -> void:
	_current_character = character
	_current_skill = null
	_current_custom_target = null

func _on_skill_selected(skill_config: SkillConfig) -> void:
	_current_skill = skill_config
	_current_custom_target = null

func _on_character_selected(character: Character) -> void:
	if _current_skill == null:
		return
	
	if !_current_skill.requires_target_selection():
		return
	
	_current_custom_target = character

func _roll_pressed() -> void:
	if _current_skill == null:
		return
	
	if _current_skill.requires_target_selection() && _current_custom_target == null:
		print_rich("[color='red']REQUIRES CUSTOM TARGETTING!!![/color]")
		return
	
	_execute_skill()

func _execute_skill() -> void:
	var skill_targets_context := SkillTargetsContext.new(_all_characters, _current_custom_target)
	var skill_cast_context: SkillCastContext = _resolve_skill_cast_context()
	
	SkillExecutionSystem.execute_skill(_current_skill, skill_targets_context, skill_cast_context)

func _resolve_skill_cast_context() -> SkillCastContext:
	var skill_context := SkillCastContext.new(_current_character, _current_skill)
	
	skill_context.dice_result = DiceSystem.roll(_current_skill.dice_config, _current_skill.roll_stat_modifier, _current_character)
	skill_context.outcome_type = RollInterpreterSystem.resolve_outcome(skill_context.dice_result.total, _current_skill.dice_config)
	
	skill_context.print_roll() # TODO: es debug
	
	return skill_context

func _exit_tree():
	CombatEventBus.combat_started.disconnect(_on_combat_started)
	CombatEventBus.turn_started.disconnect(_on_turn_started)
	CombatEventBus.skill_selected.disconnect(_on_skill_selected)
	CombatEventBus.character_selected.disconnect(_on_character_selected)
	CombatEventBus.roll_pressed.disconnect(_roll_pressed)










#
