extends Node
class_name CharacterHP

var _current_hp: int
var _max_hp: int
var _is_parrying: bool


func initialize(hp: int) -> void:
	_current_hp = hp
	_max_hp = hp

func set_parry(parry: bool) -> void:
	_is_parrying = parry

func receive_damage(_source: Character, dmg_amount: int) -> void:
	if _is_parrying:
		return
	
	_current_hp = max(_current_hp - dmg_amount, 0)
	
	if _current_hp == 0:
		print_debug("Character died!")
