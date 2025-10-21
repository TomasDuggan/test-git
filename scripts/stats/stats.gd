extends Object
class_name CharacterStats

var _all_stats: Array[StatValue] = []


func _init(character_config: CharacterConfig) -> void:
	var stats: StatsConfig = character_config.stats
	
	for stat_config: StatConfig in stats.all_stats.keys():
		var stat_value := StatValue.new(stat_config, stats.all_stats[stat_config])
		_all_stats.append(stat_value)

func get_all_stats() -> Array[StatValue]:
	return _all_stats

"""
Formula de D&D. Funciona bien si los stats base giran alrededor de 10.
Ej:
1, 2 -> -4
3, 4 -> -3
5, 6 -> -2
7, 8 -> -1
9, 10, 11 -> +0  ----- 10 es el punto medio -----
12, 13 -> +1
14, 15 -> +2
16, 17 -> +3
18, 19 -> +4
"""
func get_roll_stat_modifier_value(stat_config: StatConfig) -> int:
	var stat_value: float = float(get_stat_points_by_config(stat_config))
	return floor((stat_value - 10.0) / 2.0)

func get_stat_points_by_config(stat_config: StatConfig) -> int:
	return _get_stat_by_config(stat_config).points

func get_stat_points_by_type(type: StatConfig.StatType) -> int:
	return _get_stat_by_type(type).points

func _get_stat_by_config(stat_config: StatConfig) -> StatValue:
	for stat: StatValue in _all_stats:
		if stat.config == stat_config:
			return stat
	
	push_error("Todos los Characters deberian tener algun valor para todos los Stats.")
	return null

func _get_stat_by_type(type: StatConfig.StatType) -> StatValue:
	for stat: StatValue in _all_stats:
		if stat.config.type == type:
			return stat
	
	push_error("Todos los Characters deberian tener algun valor para todos los Stats.")
	return null
