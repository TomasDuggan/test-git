extends Object
class_name DiceResult
"""
DTO para el resultado del roll
"""

var rolls: Array[int]
var total: int
var unmodified_total: int
var stat_modifier: int


func _init(rolls_arg: Array[int], unmodified_total_arg: int, total_arg: int, stat_modifier_arg: int):
	rolls = rolls_arg
	unmodified_total = unmodified_total_arg
	total = total_arg
	stat_modifier = stat_modifier_arg
