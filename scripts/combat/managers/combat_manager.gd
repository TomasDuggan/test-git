extends Node
class_name CombatManager

var _current_character: Character
var _current_targets: Array[Character] = []
var _current_skill: SkillConfig


func _ready():
	CombatEventBus.turn_started.connect(_on_turn_started)
	CombatEventBus.skill_selected.connect(_on_skill_selected)
	CombatEventBus.character_selected.connect(_on_character_selected)
	CombatEventBus.roll_pressed.connect(_roll_pressed)

func _on_turn_started(character: Character) -> void:
	_current_character = character
	_current_skill = null
	_current_targets.clear()

func _on_skill_selected(skill_config: SkillConfig) -> void:
	_current_skill = skill_config
	_current_targets.clear()

func _on_character_selected(character: Character) -> void:
	if _current_skill == null:
		return
	
	if !_current_targets.has(character):
		_current_targets.append(character)

func _roll_pressed() -> void:
	if _current_skill == null:
		return
	
	if _current_skill.amount_of_targets != _current_targets.size():
		return
	
	var skill_context: SkillCastContext = _resolve_skill_context()
	SkillExecutionSystem.execute_skill(_current_skill, skill_context)

func _resolve_skill_context() -> SkillCastContext:
	var skill_context := SkillCastContext.new(_current_character, _current_targets, _current_skill)
	
	skill_context.dice_result = DiceSystem.roll(_current_skill.dice_config, _current_skill.roll_stat_modifier, _current_character)
	skill_context.outcome_type = RollInterpreterSystem.resolve_outcome(skill_context.dice_result.total, _current_skill.dice_config)
	
	skill_context.print_roll() # TODO: es debug
	
	return skill_context

func _exit_tree():
	CombatEventBus.turn_started.disconnect(_on_turn_started)
	CombatEventBus.skill_selected.disconnect(_on_skill_selected)
	CombatEventBus.character_selected.disconnect(_on_character_selected)
	CombatEventBus.roll_pressed.disconnect(_roll_pressed)










#
