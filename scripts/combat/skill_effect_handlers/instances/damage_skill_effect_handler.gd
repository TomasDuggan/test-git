extends SkillEffectHandler
class_name DamageSkillEffectHandler


func handle(config: SkillEffectConfig, cast_context: SkillCastContext, execution_context: SkillExecutionContext) -> void:
	var dmg_config := config as DamageSkillEffectConfig
	var caster: Character = cast_context.caster
	var damage_scaled_by_stat: int = caster.get_stats().scale_effect_by_stat(dmg_config.damage, config)
	
	for target: Character in resolve_targets(config.target_scope, cast_context):
		target.get_hp().receive_damage(caster, damage_scaled_by_stat)
		execution_context.total_damage_done += damage_scaled_by_stat




#
