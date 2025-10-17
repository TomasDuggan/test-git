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
	
	var roll_result: RollResult = _roll_dice()
	SkillExecutionSystem.execute_skill(_current_skill, roll_result)

func _roll_dice() -> RollResult:
	var roll_result := RollResult.new(_current_character, _current_targets, _current_skill)
	
	roll_result.dice_result = DiceSystem.roll(_current_skill, _current_character)
	roll_result.outcome_type = RollInterpreterSystem.resolve_outcome(_current_skill, roll_result.dice_result.total)
	
	roll_result.print_roll() # TODO: es debug
	
	return roll_result

func _exit_tree():
	CombatEventBus.turn_started.disconnect(_on_turn_started)
	CombatEventBus.skill_selected.disconnect(_on_skill_selected)
	CombatEventBus.character_selected.disconnect(_on_character_selected)
	CombatEventBus.roll_pressed.disconnect(_roll_pressed)










#
