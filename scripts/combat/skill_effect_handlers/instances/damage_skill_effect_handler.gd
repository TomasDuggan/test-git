extends SkillEffectHandler
class_name DamageSkillEffectHandler

const PARTIAL_DAMAGE_REDUCTION := 0.5 # TODO: esto y fail podrian ir en DamageSkillEffectConfig


func handle(config: SkillEffectConfig, roll: RollResult, context: SkillExecutionContext) -> void:
	var dmg_config := config as DamageSkillEffectConfig
	
	var damage_scaled_by_stat: int = roll.caster.get_stats().scale_effect_by_stat(dmg_config.damage, config)
	var final_damage: int = _scale_by_roll_outcome(roll.outcome_type, damage_scaled_by_stat)
	
	for target: Character in roll.targets:
		target.get_hp().receive_damage(final_damage)
		context.total_damage_done += final_damage

func _scale_by_roll_outcome(outcome_type: RollInterpreterSystem.RollOutcomeType, damage: int) -> int:
	return RollInterpreterSystem.scale_outcome(
		outcome_type,
		0,
		ceil(damage * PARTIAL_DAMAGE_REDUCTION),
		damage,
	)



#
