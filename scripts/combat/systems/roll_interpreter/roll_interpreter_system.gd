extends Object
class_name RollInterpreterSystem
"""
Interpreta los thresholds de un roll
"""

enum RollOutcomeType { FAIL, PARTIAL, SUCCESS }

const SUCCESS_THRESHOLD := 0.75
const PARTIAL_THRESHOLD := 0.5


static func resolve_outcome(total: int, dice_config: DiceConfig) -> RollOutcomeType:
	var max_roll = dice_config.amount_of_dice * dice_config.die_size
	var success_threshold = floor(max_roll * SUCCESS_THRESHOLD)
	var partial_threshold = floor(max_roll * PARTIAL_THRESHOLD)

	if total >= success_threshold:
		return RollOutcomeType.SUCCESS
	elif total >= partial_threshold:
		return RollOutcomeType.PARTIAL
	else:
		return RollOutcomeType.FAIL

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
