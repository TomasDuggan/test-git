extends Object
class_name DiceResult

var rolls: Array[int]
var total: int
var stat_modifier: int

func _init(rolls_arg: Array[int], total_arg: int, stat_modifier_arg: int):
	rolls = rolls_arg
	total = total_arg
	stat_modifier = stat_modifier_arg
