@abstract
extends Object
class_name StatusEffect

signal effect_ended(config: StatusEffectConfig)

var character: Character
var config: StatusEffectConfig
var _remaining_turns: int
var _apply_on_start_turn: bool


func initialize(character_arg: Character, config_arg: StatusEffectConfig) -> void:
	character = character_arg
	config = config_arg
	_remaining_turns = config_arg.turns_duration
	_apply_on_start_turn = apply_on_start_turn()

func matches_config(other_config: StatusEffectConfig) -> bool:
	return config == other_config

func add_turns(turns: int) -> void:
	_remaining_turns += turns

func turn_started() -> void:
	if _apply_on_start_turn:
		_apply()

func turn_ended() -> void:
	if !_apply_on_start_turn:
		_apply()

func _apply() -> void:
	apply_effect()
	
	_remaining_turns -= 1
	if _remaining_turns == 0:
		effect_ended.emit(config)

@abstract
func apply_effect() -> void

@abstract
func apply_on_start_turn() -> bool




#
