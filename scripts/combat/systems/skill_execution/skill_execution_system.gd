extends Object
class_name SkillExecutionSystem

enum SkillEffectType { DAMAGE, }


static func excecute_skill(skill_config: SkillConfig, roll: RollResult) -> void:
	var context := SkillExecutionContext.new()
	
	for skill_effect_config: SkillEffectConfig in skill_config.effect_configs:
		var handler: SkillEffectHandler = SkillEffectHandlerFactory.new_skill_effect_handler(skill_effect_config.get_effect_type())
		handler.handle(skill_effect_config, roll, context)



#
