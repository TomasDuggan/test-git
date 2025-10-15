extends SkillEffectConfig
class_name DamageSkillEffectConfig

@export var damage: int


func get_effect_type() -> SkillExecutionSystem.SkillEffectType:
	return SkillExecutionSystem.SkillEffectType.DAMAGE
