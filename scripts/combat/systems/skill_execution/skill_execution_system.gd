extends Object
class_name SkillExecutionSystem


static func execute_skill(skill_config: SkillConfig, skill_cast_context: SkillCastContext) -> void:
	var context := SkillExecutionContext.new()
	
	if skill_cast_context.outcome_type != RollInterpreterSystem.RollOutcomeType.FAIL:
		_handle_skill_effects(skill_config.effect_configs, skill_cast_context, context)
	
	_handle_recoil_effects(skill_config.recoil_configs, skill_cast_context, context)

static func _handle_skill_effects(effect_configs: Array[SkillEffectConfig], skill_cast_context: SkillCastContext, context: SkillExecutionContext) -> void:
	for skill_effect_config: SkillEffectConfig in effect_configs:
		var handler: SkillEffectHandler = SkillEffectHandlerFactory.new_skill_effect_handler(skill_effect_config.get_effect_type())
		handler.handle(skill_effect_config, skill_cast_context, context)

static func _handle_recoil_effects(recoil_configs: Array[SkillRecoilConfig], skill_cast_context: SkillCastContext, context: SkillExecutionContext) -> void:
	for skill_recoil_config: SkillRecoilConfig in _filter_recoils_by_outcome(recoil_configs, skill_cast_context.outcome_type):
		var handler: SkillRecoilHandler = SkillRecoilHandlerFactory.new_skill_recoil_handler(skill_recoil_config.get_recoil_type())
		handler.handle(skill_recoil_config, skill_cast_context, context)

static func _filter_recoils_by_outcome(recoil_configs: Array[SkillRecoilConfig], outcome_type: RollInterpreterSystem.RollOutcomeType) -> Array[SkillRecoilConfig]:
	return recoil_configs.filter(func(recoil_config: SkillRecoilConfig):
		return recoil_config.trigger_outcome == outcome_type
	)









#
