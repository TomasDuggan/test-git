extends SkillEffectHandler
class_name HealSkillEffectHandler



func handle(config: SkillEffectConfig, cast_context: SkillCastContext, _execution_context: SkillExecutionContext) -> void:
	var heal_config := config as HealSkillEffectConfig
	var heal_scaled_by_stat: int = cast_context.caster.get_stats().scale_effect_by_stat(heal_config.heal_amount, config)
	
	for target: Character in resolve_targets(config.target_scope, cast_context):
		target.get_hp().heal(heal_scaled_by_stat)




#
