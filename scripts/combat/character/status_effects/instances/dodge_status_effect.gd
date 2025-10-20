extends StatusEffect
class_name DodgeStatusEffect


func on_receiving_damage(info: DamageInfo) -> void:
	info.damage = 0
	consume_stack()

func on_status_reapplied(new_config: StatusEffectConfig) -> void:
	stacks += new_config.stacks

#
