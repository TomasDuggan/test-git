extends SkillEffectConfig
class_name DamageSkillEffectConfig

@export var damage: int
@export var damage_type: DamageInfo.DamageType
@export var pierce_resistances: bool


func get_effect_type() -> SkillEffectType:
	return SkillEffectType.DAMAGE
