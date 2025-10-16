extends SkillEffectHandler
class_name DamageSkillEffectHandler


func handle(config: SkillEffectConfig, roll: RollResult, context: SkillExecutionContext) -> void:
	var dmg_config := config as DamageSkillEffectConfig
	var damage: int = dmg_config.damage
	
	# TODO: modificar damage segun outcome_type
	
	for target: Character in roll.targets:
		target.hp.receive_damage(damage)
		context.total_damage_done += damage
