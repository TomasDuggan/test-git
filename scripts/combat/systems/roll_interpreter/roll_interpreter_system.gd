extends Object
class_name RollInterpreterSystem
"""
Interpreta los thresholds de un roll.
Un Skill tiene Efectos y Recoils, y siguen reglas similares a los PbtA:
	- Critical Fail => No definido aun.
	- Fail => No aplica efectos y ocurren recoils negativos (si tiene).
	- Partial => Aplica efectos, pero ocurren recoils negativos (si tiene).
	- Success => Aplica efectos y ocurren recoils positivos (si tiene).
	- Critical Success => No definido aun.
"""

enum RollOutcomeType {
	CRITICAL_FAIL,
	FAIL,
	PARTIAL,
	SUCCESS,
	CRITICAL_SUCCESS
}

const PARTIAL_THRESHOLD := 0.5 # Mas del PARTIAL_THRESHOLD %
const SUCCESS_THRESHOLD := 0.75 # Mas del SUCCESS_THRESHOLD %

const APPLY_EFFECTS_OUTCOMES := [
	RollOutcomeType.PARTIAL,
	RollOutcomeType.SUCCESS,
	RollOutcomeType.CRITICAL_SUCCESS
]
const APPLY_RECOILS_OUTCOMES := [
	RollOutcomeType.CRITICAL_FAIL,
	RollOutcomeType.FAIL,
]

static func resolve_outcome(roll_total: int, dice_config: DiceConfig) -> RollOutcomeType:
	var min_roll: int = dice_config.amount_of_dice
	var max_roll: int = dice_config.amount_of_dice * dice_config.die_size
	
	var success_threshold: int = floor(max_roll * SUCCESS_THRESHOLD)
	var partial_threshold: int = floor(max_roll * PARTIAL_THRESHOLD)
	
	if roll_total == min_roll:
		return RollOutcomeType.CRITICAL_FAIL
	if roll_total == max_roll:
		return RollOutcomeType.CRITICAL_SUCCESS
	if roll_total >= success_threshold:
		return RollOutcomeType.SUCCESS
	if roll_total >= partial_threshold:
		return RollOutcomeType.PARTIAL
	else:
		return RollOutcomeType.FAIL

static func can_apply_skill_effects(roll_outcome: RollOutcomeType) -> bool:
	return APPLY_EFFECTS_OUTCOMES.has(roll_outcome)

static func can_apply_skill_recoils(roll_outcome: RollOutcomeType) -> bool:
	return APPLY_RECOILS_OUTCOMES.has(roll_outcome)

#
