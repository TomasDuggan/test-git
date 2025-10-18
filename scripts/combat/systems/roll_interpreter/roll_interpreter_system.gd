extends Object
class_name RollInterpreterSystem
"""
Interpreta los thresholds de un roll
"""

enum RollOutcomeType { FAIL, PARTIAL, SUCCESS, CRITICAL_SUCCESS }

const CRITICAL_SUCCESS_THRESHOLD := 1.0
const SUCCESS_THRESHOLD := 0.8
const PARTIAL_THRESHOLD := 0.5


static func resolve_outcome(roll_total: int, dice_config: DiceConfig) -> RollOutcomeType:
	var max_roll = dice_config.amount_of_dice * dice_config.die_size
	var critical_success = floor(max_roll * CRITICAL_SUCCESS_THRESHOLD)
	var success_threshold = floor(max_roll * SUCCESS_THRESHOLD)
	var partial_threshold = floor(max_roll * PARTIAL_THRESHOLD)

	if roll_total == critical_success:
		return RollOutcomeType.CRITICAL_SUCCESS
	elif roll_total > success_threshold:
		return RollOutcomeType.SUCCESS
	elif roll_total > partial_threshold:
		return RollOutcomeType.PARTIAL
	else:
		return RollOutcomeType.FAIL


#
