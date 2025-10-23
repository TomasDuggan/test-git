extends Object
class_name SkillExecutionSystem
"""
Ejecutador de Skills.
"""

var _execution_context: SkillExecutionContext
var _targets_context: SkillTargetsContext
var _cast_context: SkillCastContext


func _init(targets_context: SkillTargetsContext, cast_context: SkillCastContext):
	_targets_context = targets_context
	_cast_context = cast_context
	_execution_context = SkillExecutionContext.new()

func execute_skill(skill_config: SkillConfig) -> void:
	var skill_outcome: SkillOutcomeConfig = skill_config.get_outcome_config_by_type(_cast_context.outcome_type)
	var positive_effects: Array[SkillEffectConfig] = skill_outcome.get_positive_effects()
	var negative_effects: Array[SkillEffectConfig] = skill_outcome.get_negative_effects()
	
	_execute_effects(positive_effects)
	
	if !negative_effects.is_empty():
		CombatEventBus.raise_event_skill_effect_drawbacks_triggered(negative_effects)
		CombatEventBus.skill_effect_drawback_selected.connect(_on_skill_drawback_selected, CONNECT_ONE_SHOT)

func _execute_effects(effect_configs: Array[SkillEffectConfig]) -> void:
	for skill_effect_config: SkillEffectConfig in effect_configs:
		var handler: SkillEffectHandler = SkillEffectHandlerFactory.new_skill_effect_handler(skill_effect_config.get_effect_type())
		var targets: Array[Character] = SkillTargetsResolver.resolve_targets(skill_effect_config.target_scope, _cast_context.caster, _targets_context)
		
		handler.handle(skill_effect_config, targets, _cast_context, _execution_context)

func _on_skill_drawback_selected(drawback: SkillEffectConfig) -> void:
	_execute_effects([drawback])












#
