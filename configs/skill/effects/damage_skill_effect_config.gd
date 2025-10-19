extends SkillEffectConfig
class_name DamageSkillEffectConfig

@export var damage: int
@export var pierce_armor: bool
@export var pierce_mr: bool


func get_effect_type() -> SkillEffectType:
	return SkillEffectType.DAMAGE
