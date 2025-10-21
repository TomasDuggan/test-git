extends Object
class_name DiceSystem
"""
Calcula el resultado de tirar los dados
"""

static func roll(dice_config: DiceConfig, roll_stat_modifier: StatConfig.StatType, character: Character) -> DiceResult:
	var rolls: Array[int] = []
	
	for i in range(dice_config.amount_of_dice):
		rolls.append(randi_range(1, dice_config.die_size))
	
	var dice_sum := 0
	for r: int in rolls:
		dice_sum += r
	
	var stat_modifier: int = character.get_roll_stat_modifier_value(roll_stat_modifier)
	var total: int = dice_sum + stat_modifier
	
	return DiceResult.new(
		rolls,
		total,
		stat_modifier
	)
