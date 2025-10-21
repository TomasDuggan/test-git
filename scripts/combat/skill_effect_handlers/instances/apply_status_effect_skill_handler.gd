extends SkillEffectHandler
class_name ApplyStatusEffectSkillEffectHandler


func handle(config: SkillEffectConfig, targets: Array[Character], cast_context: SkillCastContext, _execution_context: SkillExecutionContext) -> void:
	var status_effect_skill_config := config as ApplyStatusSkillEffectConfig
	var caster: Character = cast_context.caster
	var extra_stacks: int = _get_extra_stacks(caster, status_effect_skill_config)
	
	for target: Character in targets:
		for status_effect_config: StatusEffectConfig in status_effect_skill_config.statuses:
			caster.do_apply_status_effect(target, status_effect_config, extra_stacks)

func _get_extra_stacks(caster: Character, config: ApplyStatusSkillEffectConfig) -> int:
	if config.scaling_stat == null || config.stack_per_stat_point == 0:
		return 0
	
	return caster.get_stat_amount(config.scaling_stat) * config.stack_per_stat_point

#
