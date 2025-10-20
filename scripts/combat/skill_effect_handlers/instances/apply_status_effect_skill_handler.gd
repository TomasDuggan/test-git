extends SkillEffectHandler
class_name ApplyStatusEffectSkillEffectHandler


func handle(config: SkillEffectConfig, targets: Array[Character], cast_context: SkillCastContext, _execution_context: SkillExecutionContext) -> void:
	var status_effect_skill_config := config as ApplyStatusSkillEffectConfig
	var caster: Character = cast_context.caster
	
	for target: Character in targets:
		for status_effect_config: StatusEffectConfig in status_effect_skill_config.statuses:
			caster.do_apply_status_effect(target, status_effect_config)




#
