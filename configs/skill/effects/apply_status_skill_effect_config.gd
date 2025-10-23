extends SkillEffectConfig
class_name ApplyStatusSkillEffectConfig

@export var statuses: Array[StatusEffectConfig]

func get_effect_type() -> SkillEffectType:
	return SkillEffectType.APPLY_STATUS_EFFECT

func get_description() -> String:
	var scope_text: String = _get_target_scope_text()
	var statuses_text: String = ""
	
	for status: StatusEffectConfig in statuses:
		statuses_text += status.get_description() + " "
	
	return "%s to %s." % [statuses_text, scope_text]
