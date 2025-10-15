extends Node
class_name TurnManager

var _characters: Array[Character]


func _ready():
	CombatEventBus.combat_started.connect(_on_combat_started)

func _on_combat_started(characters: Array[Character]) -> void:
	_characters = characters
	
	var first_turn_char: Character = _characters.front() # TODO
	first_turn_char.start_turn()
	CombatEventBus.raise_event_turn_started(first_turn_char)

func _exit_tree():
	CombatEventBus.combat_started.disconnect(_on_combat_started)
