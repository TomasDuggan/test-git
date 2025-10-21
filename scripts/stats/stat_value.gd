extends Object
class_name StatValue

var type: StatConfig.StatType
var points: int

func _init(type_arg: StatConfig.StatType, points_arg: int) -> void:
	type = type_arg
	points = points_arg
