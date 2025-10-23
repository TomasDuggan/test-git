extends SkillEffectConfig
class_name DamageSkillEffectConfig

@export var damage: int
@export var damage_type: DamageInfo.DamageType
@export var pierce_resistances: bool


func get_effect_type() -> SkillEffectType:
	return SkillEffectType.DAMAGE

func get_description() -> String:
	var scope_text: String = _get_target_scope_text()
	var dmg_type_text: String = DamageInfo.get_damage_type_text(damage_type)
	var pierce_text: String = " (ignores resistances)" if pierce_resistances else ""
	
	return "Deal %d %s damage to %s%s." % [damage, dmg_type_text, scope_text, pierce_text]
