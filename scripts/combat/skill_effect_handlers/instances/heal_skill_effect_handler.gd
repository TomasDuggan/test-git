extends SkillEffectHandler
class_name HealSkillEffectHandler


func handle(config: SkillEffectConfig, targets: Array[Character], cast_context: SkillCastContext, execution_context: SkillExecutionContext) -> void:
	var heal_config := config as HealSkillEffectConfig
	var heal_power: int = _get_heal_power(heal_config, execution_context.total_damage_done)
	var scaled_heal: int = super.scale_effect_by_stat(cast_context.caster, heal_power, config)
	
	for target: Character in targets:
		execution_context.total_hp_healed += target.heal(scaled_heal)

func _get_heal_power(heal_config: HealSkillEffectConfig, total_damage_done: int) -> int:
	if heal_config.source_type == HealSkillEffectConfig.HealSource.FLAT:
		return heal_config.heal_amount
	else:
		return floor(total_damage_done * heal_config.damage_multiplier)




#
