extends Object
class_name CharacterStats

signal stats_changed() # TODO: emitir el StatValue que cambio

var _all_stats: Array[StatValue] = []

const MIN_STAT_POINTS := 1
const MAX_STAT_POINTS := 19


func _init(character_config: CharacterConfig) -> void:
	var stats: StatsConfig = character_config.stats
	
	for stat_type: StatConfig.StatType in stats.all_stats.keys():
		var stat_value := StatValue.new(stat_type, stats.all_stats[stat_type])
		_all_stats.append(stat_value)

func get_all_stats() -> Array[StatValue]:
	return _all_stats

func alter_stat(type: StatConfig.StatType, modifier: int) -> void:
	var current_points: int = _get_stat_by_type(type).points
	_get_stat_by_type(type).points = clamp(
		current_points + modifier,
		MIN_STAT_POINTS,
		MAX_STAT_POINTS
	)
	
	stats_changed.emit()

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
func get_roll_stat_modifier_value(stat_type: StatConfig.StatType) -> int:
	var stat_value: float = float(get_stat_points_by_type(stat_type))
	var modifier: int = floor((stat_value - 10.0) / 2.0)
	
	# TODO: Borrar, es para debug en consola
	print_rich("[color='green']%s ROLL MODIFIER: +%s[/color]" % [EnumsHelper.enum_to_string(StatConfig.StatType, stat_type), str(modifier)])
	
	return modifier

func get_stat_points_by_type(type: StatConfig.StatType) -> int:
	return _get_stat_by_type(type).points

func _get_stat_by_type(type: StatConfig.StatType) -> StatValue:
	for stat: StatValue in _all_stats:
		if stat.type == type:
			return stat
	
	push_error("Todos los Characters deberian tener algun valor para todos los Stats.")
	return null
