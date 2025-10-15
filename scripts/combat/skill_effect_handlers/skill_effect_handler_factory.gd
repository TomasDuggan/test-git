extends Object
class_name SkillEffectHandlerFactory

static func new_skill_effect_handler(type: SkillExecutionSystem.SkillEffectType) -> SkillEffectHandler:
	match type:
		SkillExecutionSystem.SkillEffectType.DAMAGE:
			return DamageSkillEffectHandler.new()
		_:
			push_error("No deberia llegar aca!!! Handler no encontrado para el type " + str(type))
			return null
