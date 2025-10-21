extends SkillEffectHandler
class_name HealSkillEffectHandler


func handle(config: SkillEffectConfig, targets: Array[Character], cast_context: SkillCastContext, execution_context: SkillExecutionContext) -> void:
	var caster: Character = cast_context.caster
	var heal_config := config as HealSkillEffectConfig
	var heal_power: int = _get_heal_power(heal_config, execution_context.total_damage_done)
	
	for target: Character in targets:
		execution_context.total_hp_healed += caster.do_healing(target, heal_power)

func _get_heal_power(heal_config: HealSkillEffectConfig, total_damage_done: int) -> int:
	if heal_config.source_type == HealSkillEffectConfig.HealSource.FLAT:
		return heal_config.heal_amount
	else:
		return floor(total_damage_done * heal_config.damage_multiplier)




#
