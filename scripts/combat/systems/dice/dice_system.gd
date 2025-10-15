extends Object
class_name DiceSystem


static func roll(skill_config: SkillConfig, _character: Character) -> DiceResult:
	var rolls: Array[int] = []
	
	for i in range(skill_config.amount_of_dice):
		rolls.append(randi_range(1, skill_config.die_size))
	
	var total = 0
	for r in rolls:
		total += r
	
	return DiceResult.new(
		rolls,
		total,
	)
