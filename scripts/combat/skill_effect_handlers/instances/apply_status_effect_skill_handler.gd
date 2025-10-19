extends SkillEffectHandler
class_name ApplyStatusEffectSkillEffectHandler


func handle(config: SkillEffectConfig, targets: Array[Character], _cast_context: SkillCastContext, _execution_context: SkillExecutionContext) -> void:
	var status_effect_skill_config := config as ApplyStatusSkillEffectConfig
	
	for target: Character in targets:
		for status_effect_config: StatusEffectConfig in status_effect_skill_config.statuses:
			target.add_status_effect(status_effect_config)




#
