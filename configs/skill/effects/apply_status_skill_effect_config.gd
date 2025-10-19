extends SkillEffectConfig
class_name ApplyStatusSkillEffectConfig

@export var statuses: Array[StatusEffectConfig]


func get_effect_type() -> SkillEffectType:
	return SkillEffectType.APPLY_STATUS_EFFECT
