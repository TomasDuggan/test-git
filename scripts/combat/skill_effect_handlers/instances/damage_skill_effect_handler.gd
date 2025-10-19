extends SkillEffectHandler
class_name DamageSkillEffectHandler


func handle(config: SkillEffectConfig, targets: Array[Character], cast_context: SkillCastContext, execution_context: SkillExecutionContext) -> void:
	var dmg_config := config as DamageSkillEffectConfig
	var caster: Character = cast_context.caster
	var damage_scaled_by_stat: int = super.scale_effect_by_stat(caster, dmg_config.damage, config)
	var damage_info := DamageInfo.new(
		caster,
		damage_scaled_by_stat,
		dmg_config.pierce_armor,
		dmg_config.pierce_mr,
	)
	
	for target: Character in targets:
		execution_context.total_damage_done += target.get_hp().receive_damage(damage_info)




#
