extends StatusEffect
class_name StunStatusEffect


func on_turn_started() -> void:
	super.consume_stack()

func can_act() -> bool:
	return false

func on_status_reapplied(_new_config: StatusEffectConfig) -> void:
	pass

#
