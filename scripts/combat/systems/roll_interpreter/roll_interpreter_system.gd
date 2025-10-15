extends Object
class_name RollInterpreterSystem


enum RollOutcomeType { FAIL, PARTIAL, SUCCESS }

static func resolve_outcome(skill_config: SkillConfig, dice_total: int) -> RollOutcomeType:
	if dice_total <= skill_config.thresholds[RollOutcomeType.FAIL]:
		return RollOutcomeType.FAIL
	
	if dice_total <= skill_config.thresholds[RollOutcomeType.PARTIAL]:
		return RollOutcomeType.PARTIAL
	
	return RollOutcomeType.SUCCESS




#
