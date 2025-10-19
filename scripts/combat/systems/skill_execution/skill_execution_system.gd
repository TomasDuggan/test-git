extends Object
class_name SkillExecutionSystem
"""
Ejecutador de Skills.
"""

enum TargetScope {
	CUSTOM_SELECTION, # Para poder seleccionar un target.
	SELF,
	ALL_ALLIES,
	ALL_ENEMIES,
	ALL_CHARACTERS,
}

static func execute_skill(skill_config: SkillConfig, cast_context: SkillCastContext) -> void:
	var execution_context := SkillExecutionContext.new()
	
	if RollInterpreterSystem.can_apply_skill_effects(cast_context.outcome_type):
		_handle_skill_effects(skill_config.effect_configs, cast_context, execution_context)
	
	_handle_recoil_effects(skill_config.recoil_configs, cast_context, execution_context)

static func _handle_skill_effects(effect_configs: Array[SkillEffectConfig], cast_context: SkillCastContext, execution_context: SkillExecutionContext) -> void:
	for skill_effect_config: SkillEffectConfig in effect_configs:
		var handler: SkillEffectHandler = SkillEffectHandlerFactory.new_skill_effect_handler(skill_effect_config.get_effect_type())
		var targets: Array[Character] = SkillTargetsResolver.resolve_targets(skill_effect_config.target_scope, cast_context)
		
		handler.handle(skill_effect_config, targets, cast_context, execution_context)

static func _handle_recoil_effects(recoil_configs: Array[SkillRecoilConfig], cast_context: SkillCastContext, execution_context: SkillExecutionContext) -> void:
	for skill_recoil_config: SkillRecoilConfig in _filter_recoils_by_outcome(recoil_configs, cast_context.outcome_type):
		var handler: SkillRecoilHandler = SkillRecoilHandlerFactory.new_skill_recoil_handler(skill_recoil_config.get_recoil_type())
		var targets: Array[Character] = SkillTargetsResolver.resolve_targets(skill_recoil_config.target_scope, cast_context)
		
		handler.handle(skill_recoil_config, targets, cast_context, execution_context)

static func _filter_recoils_by_outcome(recoil_configs: Array[SkillRecoilConfig], outcome_type: RollInterpreterSystem.RollOutcomeType) -> Array[SkillRecoilConfig]:
	return recoil_configs.filter(func(recoil_config: SkillRecoilConfig):
		return recoil_config.trigger_outcome == outcome_type
	)









#
