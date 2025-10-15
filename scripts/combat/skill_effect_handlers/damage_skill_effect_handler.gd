extends SkillEffectHandler
class_name DamageSkillEffectHandler


func handle(config: SkillEffectConfig, roll: RollResult, context: SkillExecutionContext) -> void:
	var c = config as DamageSkillEffectConfig
	var a
