extends Object
class_name SkillEffectHandlerFactory


static func new_skill_effect_handler(type: SkillEffectConfig.SkillEffectType) -> SkillEffectHandler:
	match type:
		SkillEffectConfig.SkillEffectType.DAMAGE:
			return DamageSkillEffectHandler.new()
		SkillEffectConfig.SkillEffectType.HEAL:
			return HealSkillEffectHandler.new()
		SkillEffectConfig.SkillEffectType.APPLY_STATUS_EFFECT:
			return ApplyStatusEffectSkillEffectHandler.new()
		_:
			push_error("Handler no encontrado para el type " + EnumsHelper.enum_to_string(SkillEffectConfig.SkillEffectType, type))
			return null
