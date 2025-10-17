extends Object
class_name DiceSystem


static func roll(skill_config: SkillConfig, character: Character) -> DiceResult:
	var rolls: Array[int] = []
	
	for i in range(skill_config.amount_of_dice):
		rolls.append(randi_range(1, skill_config.die_size))
	
	var dice_sum := 0
	for r: int in rolls:
		dice_sum += r
	
	var stat_modifier: int = character.get_stats().get_stat_modifier(skill_config.roll_stat_modifier)
	var total: int = dice_sum + stat_modifier
	
	return DiceResult.new(
		rolls,
		total,
		stat_modifier
	)
