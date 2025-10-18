extends SkillEffectHandler
class_name HealSkillEffectHandler

const PARTIAL_HEAL_REDUCTION := 0.5 # TODO: esto y fail podrian ir en DamageSkillEffectConfig


func handle(config: SkillEffectConfig, cast_context: SkillCastContext, _execution_context: SkillExecutionContext) -> void:
	var heal_config := config as HealSkillEffectConfig
	
	var heal_scaled_by_stat: int = cast_context.caster.get_stats().scale_effect_by_stat(heal_config.heal_amount, config)
	var final_heal_amount: int = _scale_by_roll_outcome(cast_context.outcome_type, heal_scaled_by_stat)
	
	for target: Character in cast_context.targets:
		target.get_hp().heal(final_heal_amount)

func _scale_by_roll_outcome(outcome_type: RollInterpreterSystem.RollOutcomeType, heal: int) -> int:
	return RollInterpreterSystem.scale_outcome(
		outcome_type,
		0,
		ceil(heal * PARTIAL_HEAL_REDUCTION),
		heal,
	)



#
