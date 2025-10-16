extends Object
class_name CharacterStats

var _all_stats: Array[StatValue] = []


func _init(stats: StatsConfig) -> void:
	for stat_config: StatConfig in stats.all_stats.keys():
		var stat_value := StatValue.new(stat_config, stats.all_stats[stat_config])
		_all_stats.append(stat_value)

func scale_effect_by_stat(base: Variant, effect_config: SkillEffectConfig) -> Variant:
	var stat_amount: int = get_stat_amount(effect_config.scaling_stat)
	return base + stat_amount * effect_config.stat_scaling_multiplier

func get_stat_amount(stat_config: StatConfig) -> int:
	return _get_stat(stat_config).amount

func _get_stat(stat_config: StatConfig) -> StatValue:
	for stat: StatValue in _all_stats:
		if stat.config == stat_config:
			return stat
	
	push_error("No deberia llegar aca.")
	return null
