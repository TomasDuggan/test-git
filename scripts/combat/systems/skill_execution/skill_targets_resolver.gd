extends Object
class_name SkillTargetsResolver


static func resolve_targets(target_scope: SkillEffectConfig.TargetScope, caster: Character, context: SkillTargetsContext) -> Array[Character]:
	match target_scope:
		SkillEffectConfig.TargetScope.CUSTOM_SELECTION:
			return [context.custom_target]
		SkillEffectConfig.TargetScope.SELF:
			return [caster]
		SkillEffectConfig.TargetScope.ALL_ALLIES:
			return context.get_targets_by_faction(caster, true)
		SkillEffectConfig.TargetScope.ALL_ENEMIES:
			return context.get_targets_by_faction(caster, false)
		SkillEffectConfig.TargetScope.ALL_CHARACTERS:
			return context.all_characters
		_:
			push_error("SkillEffectHandler. Target Scope no encontrado: " + EnumsHelper.enum_to_string(SkillEffectConfig.TargetScope, target_scope))
			return []





#
