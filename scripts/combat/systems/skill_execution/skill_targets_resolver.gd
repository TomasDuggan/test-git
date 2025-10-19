extends Object
class_name SkillTargetsResolver

static func resolve_targets(target_scope: SkillExecutionSystem.TargetScope, context: SkillCastContext) -> Array[Character]:
	match target_scope:
		SkillExecutionSystem.TargetScope.CUSTOM_SELECTION:
			return [context.custom_target]
		SkillExecutionSystem.TargetScope.SELF:
			return [context.caster]
		SkillExecutionSystem.TargetScope.ALL_ALLIES:
			return _get_targets_by_faction(context, true)
		SkillExecutionSystem.TargetScope.ALL_ENEMIES:
			return _get_targets_by_faction(context, false)
		SkillExecutionSystem.TargetScope.ALL_CHARACTERS:
			return context.all_characters
		_:
			push_error("SkillEffectHandler. Target Scope no encontrado: " + EnumsHelper.enum_to_string(SkillExecutionSystem.TargetScope, target_scope))
			return []

static func _get_targets_by_faction(context: SkillCastContext, is_ally: bool) -> Array[Character]:
	return context.all_characters.filter(func(c: Character):
		return c.is_ally_of(context.caster) == is_ally
	)




#
