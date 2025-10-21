extends SkillEffectHandler
class_name DamageSkillEffectHandler


func handle(config: SkillEffectConfig, targets: Array[Character], cast_context: SkillCastContext, execution_context: SkillExecutionContext) -> void:
	var dmg_config := config as DamageSkillEffectConfig
	var caster: Character = cast_context.caster
	var damage_info := DamageInfo.new(
		caster,
		dmg_config.damage,
		dmg_config.damage_type,
		dmg_config.pierce_resistances
	)
	
	for target: Character in targets:
		execution_context.total_damage_done += caster.do_damage(target, damage_info)




#
