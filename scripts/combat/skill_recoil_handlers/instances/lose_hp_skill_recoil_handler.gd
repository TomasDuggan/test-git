extends SkillRecoilHandler
class_name LoseHPSkillRecoilHandler


func handle(config: SkillRecoilConfig, roll: RollResult, _context: SkillExecutionContext) -> void:
	var lose_hp_config := config as LoseHPSkillRecoilConfig
	
	roll.caster.get_hp().receive_damage(lose_hp_config.hp_amount)


#
