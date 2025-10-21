@abstract
extends Object
class_name StatusEffect
"""
Efecto de estado de un Character
"""

signal effect_ended(config: StatusEffectConfig)

var character: Character
var config: StatusEffectConfig
var stacks: int


func initialize(character_arg: Character, config_arg: StatusEffectConfig, extra_stacks: int) -> void:
	character = character_arg
	config = config_arg
	stacks = config_arg.stacks + extra_stacks
	
	on_applied()

func matches_config(other_config: StatusEffectConfig) -> bool:
	return config == other_config

func get_stacks() -> int:
	return stacks

func consume_stack() -> void:
	stacks -= 1
	if stacks == 0:
		effect_ended.emit(config)

func is_positive() -> bool:
	return config.is_positive()

@abstract
func on_status_reapplied(new_config: StatusEffectConfig) -> void

#region Hooks
func on_applied() -> void:
	pass

func can_act() -> bool:
	return true

func on_turn_started() -> void:
	pass

func on_turn_ended() -> void:
	pass

func on_doing_damage(_info: DamageInfo) -> void:
	pass

func on_receiving_damage(_info: DamageInfo) -> void:
	pass
#endregion




#
