extends SkillEffectConfig
class_name HealSkillEffectConfig

@export var heal_amount: int


func get_effect_type() -> SkillEffectType:
	return SkillEffectType.HEAL
