extends Object
class_name CharacterStats

var _all_stats: Array[StatValue] = []


func _init(stats: StatsConfig) -> void:
	for stat_config: StatConfig in stats.all_stats.keys():
		var stat_value := StatValue.new(stat_config, stats.all_stats[stat_config])
		_all_stats.append(stat_value)

"""
Formula de D&D. Funciona bien si los stats base giran alrededor de 10.
Ej:
3 -> -3
8 -> -1
10 -> 0  ----- 10 es el punto medio -----
14 -> +2
18 -> +4
"""
func get_roll_stat_modifier_value(stat_config: StatConfig) -> int:
	var stat_value: float = float(get_stat_amount(stat_config))
	return floor((stat_value - 10.0) / 2.0)

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
