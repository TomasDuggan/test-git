extends Node
class_name TurnManager

var _all_characters: Array[Character]
var _remaining_characters: Array[Character]
var _active_character: Character

var _current_turn := 0
var _current_round := 0


func _ready():
	CombatEventBus.combat_started.connect(_on_combat_started)
	CombatEventBus.end_turn_pressed.connect(_end_turn)

func _on_combat_started(characters: Array[Character]) -> void:
	_all_characters = characters
	_remaining_characters = characters.duplicate()
	
	for character: Character in characters:
		character.force_end_turn.connect(_end_turn)
	
	_next_turn()

func _next_turn() -> void:
	_current_turn += 1
	
	if _remaining_characters.is_empty():
		_next_round()
		return
	
	var fastest_character: Character = _find_fastest_character()
	
	_active_character = fastest_character
	_remaining_characters.erase(_active_character)
	_active_character.start_turn()
	CombatEventBus.raise_event_turn_started(_active_character)

func _next_round() -> void:
	_current_round += 1
	_current_turn = 0
	_remaining_characters = _all_characters.duplicate()
	_next_turn()

func _end_turn() -> void:
	_active_character.end_turn()
	CombatEventBus.raise_event_turn_ended(_active_character)
	_next_turn()

func _find_fastest_character() -> Character:
	var fastest_character: Character = null
	var max_speed := int(-INF)
	
	for character: Character in _remaining_characters:
		if character.is_faster_than(max_speed):
			fastest_character = character
			max_speed = fastest_character.get_speed()
	
	return fastest_character

func _exit_tree():
	CombatEventBus.combat_started.disconnect(_on_combat_started)
	CombatEventBus.end_turn_pressed.disconnect(_end_turn)









#
