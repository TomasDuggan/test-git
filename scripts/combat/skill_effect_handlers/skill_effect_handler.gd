@abstract
extends Object
class_name SkillEffectHandler
"""
Maneja el efecto de un skill
"""

@abstract
func handle(config: SkillEffectConfig, cast_context: SkillCastContext, execution_context: SkillExecutionContext) -> void

func resolve_targets(target_scope: SkillEffectConfig.TargetScope, context: SkillCastContext) -> Array[Character]:
	match target_scope:
		SkillEffectConfig.TargetScope.CUSTOM_SELECTION:
			return [context.custom_target]
		SkillEffectConfig.TargetScope.SELF:
			return [context.caster]
		SkillEffectConfig.TargetScope.ALLIES:
			return _get_targets_by_faction(context.caster, context.all_characters, true)
		SkillEffectConfig.TargetScope.ENEMIES:
			return _get_targets_by_faction(context.caster, context.all_characters, false)
		SkillEffectConfig.TargetScope.ALL:
			return context.all_characters
		_:
			push_error("SkillEffectHandler. No deberia llegar aca")
			return []

func _get_targets_by_faction(caster: Character, characters: Array[Character], is_ally: bool) -> Array[Character]:
	return characters.filter(func(c: Character):
		return c.is_ally_of(caster) == is_ally
	)


#
