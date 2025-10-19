extends SkillRecoilHandler
class_name LoseHPSkillRecoilHandler


func handle(config: SkillRecoilConfig, targets: Array[Character], cast_context: SkillCastContext, _execution_context: SkillExecutionContext) -> void:
	var lose_hp_config := config as LoseHPSkillRecoilConfig
	var caster: Character = cast_context.caster
	var damage_info := DamageInfo.new(
		caster,
		lose_hp_config.hp_amount,
		lose_hp_config.pierce_armor,
		lose_hp_config.pierce_mr,
	)
	
	for target: Character in targets:
		target.get_hp().receive_damage(damage_info)


#
