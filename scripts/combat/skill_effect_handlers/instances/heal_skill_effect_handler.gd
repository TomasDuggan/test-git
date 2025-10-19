extends SkillEffectHandler
class_name HealSkillEffectHandler


func handle(config: SkillEffectConfig, targets: Array[Character], cast_context: SkillCastContext, execution_context: SkillExecutionContext) -> void:
	var heal_config := config as HealSkillEffectConfig
	var heal_scaled_by_stat: int = super.scale_effect_by_stat(cast_context.caster, heal_config.heal_amount, config)
	
	for target: Character in targets:
		execution_context.total_hp_healed += target.get_hp().heal(heal_scaled_by_stat)




#
