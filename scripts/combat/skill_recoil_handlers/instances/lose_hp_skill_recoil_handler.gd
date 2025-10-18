extends SkillRecoilHandler
class_name LoseHPSkillRecoilHandler


func handle(config: SkillRecoilConfig, cast_context: SkillCastContext, _execution_context: SkillExecutionContext) -> void:
	var lose_hp_config := config as LoseHPSkillRecoilConfig
	var caster: Character = cast_context.caster
	
	caster.get_hp().receive_damage(caster, lose_hp_config.hp_amount)


#
