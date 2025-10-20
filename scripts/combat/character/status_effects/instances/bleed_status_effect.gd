extends StatusEffect
class_name BleedStatusEffect

const PIERCE_ARMOR := true
const PIERCE_MR := true

var _bleed_config: BleedStatusEffectConfig
var _damage_info: DamageInfo


func on_applied() -> void:
	_bleed_config = config as BleedStatusEffectConfig
	_damage_info = DamageInfo.new(
		character,
		_bleed_config.damage_per_turn,
		PIERCE_ARMOR,
		PIERCE_MR
	)

func on_turn_started() -> void:
	character.receive_damage(_damage_info)
	super.consume_stack()

func on_status_reapplied(new_config: StatusEffectConfig) -> void:
	stacks += new_config.stacks
	
	var new_bleed_config := new_config as BleedStatusEffectConfig
	if new_bleed_config.damage_per_turn > _bleed_config.damage_per_turn:
		_damage_info.damage = new_bleed_config.damage_per_turn

#
