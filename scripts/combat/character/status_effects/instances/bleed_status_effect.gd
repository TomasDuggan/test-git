extends StatusEffect
class_name BleedStatusEffect

const PIERCE_ARMOR := true
const PIERCE_MR := true


func apply_effect() -> void:
	var bleed_config := config as BleedStatusEffectConfig
	var damage_info := DamageInfo.new(
		character,
		bleed_config.damage_per_turn,
		PIERCE_ARMOR,
		PIERCE_MR
	)
	
	character.get_hp().receive_damage(damage_info)
	

func apply_on_start_turn() -> bool:
	return true


#
