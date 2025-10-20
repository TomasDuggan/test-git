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

static func execute_skill(skill_config: SkillConfig, targets_context: SkillTargetsContext, cast_context: SkillCastContext) -> void:
	var execution_context := SkillExecutionContext.new()
	
	if RollInterpreterSystem.can_apply_skill_effects(cast_context.outcome_type):
		_handle_skill_effects(skill_config.effect_configs, targets_context, cast_context, execution_context)
	
	if RollInterpreterSystem.can_apply_skill_recoils(cast_context.outcome_type):
		_handle_skill_effects(skill_config.recoil_configs, targets_context, cast_context, execution_context)

static func _handle_skill_effects(effect_configs: Array[SkillEffectConfig], targets_context: SkillTargetsContext, cast_context: SkillCastContext, execution_context: SkillExecutionContext) -> void:
	for skill_effect_config: SkillEffectConfig in effect_configs:
		var handler: SkillEffectHandler = SkillEffectHandlerFactory.new_skill_effect_handler(skill_effect_config.get_effect_type())
		var targets: Array[Character] = SkillTargetsResolver.resolve_targets(skill_effect_config.target_scope, cast_context.caster, targets_context)
		
		handler.handle(skill_effect_config, targets, cast_context, execution_context)










#
