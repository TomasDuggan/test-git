extends Object
class_name SkillTargetsResolver


static func resolve_targets(target_scope: SkillExecutionSystem.TargetScope, caster: Character, context: SkillTargetsContext) -> Array[Character]:
	match target_scope:
		SkillExecutionSystem.TargetScope.CUSTOM_SELECTION:
			return [context.custom_target]
		SkillExecutionSystem.TargetScope.SELF:
			return [caster]
		SkillExecutionSystem.TargetScope.ALL_ALLIES:
			return context.get_targets_by_faction(caster, true)
		SkillExecutionSystem.TargetScope.ALL_ENEMIES:
			return context.get_targets_by_faction(caster, false)
		SkillExecutionSystem.TargetScope.ALL_CHARACTERS:
			return context.all_characters
		_:
			push_error("SkillEffectHandler. Target Scope no encontrado: " + EnumsHelper.enum_to_string(SkillExecutionSystem.TargetScope, target_scope))
			return []





#
