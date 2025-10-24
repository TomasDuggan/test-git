extends Object
class_name DiceSystem
"""
Calcula el resultado de tirar los dados
"""

static func roll(dice_config: DiceConfig, roll_stat_modifier: StatConfig.StatType, character: Character) -> DiceResult:
	var rolls: Array[int] = _roll_dice(dice_config)
	var dice_sum: int = _get_dice_sum(rolls)
	var stat_modifier: int = character.get_roll_stat_modifier_value(roll_stat_modifier)
	var total: int = dice_sum + stat_modifier
	
	return DiceResult.new(
		rolls,
		dice_sum,
		total,
		stat_modifier,
	)

static func _roll_dice(dice_config: DiceConfig) -> Array[int]:
	var rolls: Array[int] = []
	
	for i in range(dice_config.amount_of_dice):
		rolls.append(randi_range(1, dice_config.die_size))
	
	return rolls

static func _get_dice_sum(rolls: Array[int]) -> int:
	var dice_sum: int = 0
	
	for r: int in rolls:
		dice_sum += r
	
	return dice_sum




#
