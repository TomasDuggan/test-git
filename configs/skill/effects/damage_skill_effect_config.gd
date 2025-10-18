extends SkillEffectConfig
class_name DamageSkillEffectConfig

@export var damage: int


func get_effect_type() -> SkillEffectType:
	return SkillEffectType.DAMAGE
