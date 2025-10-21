extends StatusEffect
class_name PoisonStatusEffect

const PIERCE_RESISTANCES := true

var _poison_config: PoisonStatusEffectConfig
var _damage_info: DamageInfo


func on_applied() -> void:
	_poison_config = config as PoisonStatusEffectConfig
	_damage_info = DamageInfo.new(
		character,
		_poison_config.damage_per_turn,
		DamageInfo.DamageType.PHYSICAL,
		PIERCE_RESISTANCES
	)

func on_turn_ended() -> void:
	character.receive_damage(_damage_info)
	super.consume_stack()

func on_status_reapplied(new_config: StatusEffectConfig) -> void:
	stacks += new_config.stacks
	
	var new_poison_config := new_config as PoisonStatusEffectConfig
	if new_poison_config.damage_per_turn > _poison_config.damage_per_turn:
		_damage_info.damage = _poison_config.damage_per_turn

#
