extends Object
class_name StatValue

var stat: StatConfig
var amount: int

func _init(stat_arg: StatConfig, amount_arg: int) -> void:
	stat = stat_arg
	amount = amount_arg
