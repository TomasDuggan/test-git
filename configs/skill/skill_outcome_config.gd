extends Resource
class_name SkillOutcomeConfig


@export var effects: Array[SkillEffectConfig]

func get_positive_effects() -> Array[SkillEffectConfig]:
	return effects.filter(func(effect_config: SkillEffectConfig):
		return effect_config.tone == SkillEffectConfig.SkillEffectTone.POSITIVE
	)

func get_negative_effects() -> Array[SkillEffectConfig]:
	return effects.filter(func(effect_config: SkillEffectConfig):
		return effect_config.tone == SkillEffectConfig.SkillEffectTone.NEGATIVE
	)
