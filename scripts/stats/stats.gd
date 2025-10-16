extends Object
class_name CharacterStats

var _all_stats: Array[StatValue] = []
var _main_stat: StatValue


func _init(stats: StatsConfig) -> void:
	for stat_config: StatConfig in stats.all_stats.keys():
		var stat_value := StatValue.new(stat_config, stats.all_stats[stat_config])
		_all_stats.append(stat_value)
	
	_main_stat = StatValue.new(stats.main_stat, stats.all_stats[stats.main_stat])

func get_main_stat() -> StatValue:
	return _main_stat
