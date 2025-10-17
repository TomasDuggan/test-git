extends Object
class_name RollInterpreterSystem

enum RollOutcomeType { FAIL, PARTIAL, SUCCESS }


static func resolve_outcome(dice_config: DiceConfig, dice_total: int) -> RollOutcomeType:
	if dice_total <= dice_config.thresholds[RollOutcomeType.FAIL]:
		return RollOutcomeType.FAIL
	
	if dice_total <= dice_config.thresholds[RollOutcomeType.PARTIAL]:
		return RollOutcomeType.PARTIAL
	
	return RollOutcomeType.SUCCESS

static func scale_outcome(outcome_type: RollOutcomeType, fail_value: Variant, partial_value: Variant, success_value: Variant) -> Variant:
	match outcome_type:
		RollInterpreterSystem.RollOutcomeType.FAIL:
			return fail_value
		RollInterpreterSystem.RollOutcomeType.PARTIAL:
			return partial_value
		RollInterpreterSystem.RollOutcomeType.SUCCESS:
			return success_value
		_:
			push_error("No deberia llegar aca")
			return RollInterpreterSystem.RollOutcomeType.FAIL


#
