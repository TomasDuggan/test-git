extends Object
class_name SkillEffectHandlerFactory

static func new_skill_effect_handler(type: SkillExecutionSystem.SkillEffectType) -> SkillEffectHandler:
	match type:
		SkillExecutionSystem.SkillEffectType.DAMAGE:
			return DamageSkillEffectHandler.new()
		SkillExecutionSystem.SkillEffectType.HEAL:
			return HealSkillEffectHandler.new()
		_:
			push_error("No deberia llegar aca!!! Handler no encontrado para el type " + EnumsHelper.enum_to_string(SkillExecutionSystem.SkillEffectType, type))
			return null
