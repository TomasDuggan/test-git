extends SkillEffectConfig
class_name ApplyStatusSkillEffectConfig

@export var statuses: Array[StatusEffectConfig]
@export var scaling_stat: StatConfig.StatType
@export var stack_per_stat_point: int

func get_effect_type() -> SkillEffectType:
	return SkillEffectType.APPLY_STATUS_EFFECT
