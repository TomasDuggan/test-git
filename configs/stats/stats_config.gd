extends Resource
class_name StatsConfig

const STR_STAT_CONFIG: StatConfig = preload("uid://s52ip5rmkm8g")
const INT_STAT_CONFIG: StatConfig = preload("uid://pdqtg5p4bpst")
const DEX_STAT_CONFIG: StatConfig = preload("uid://g5su7bnt8cv")


@export var all_stats: Dictionary[StatConfig, int] = {
	STR_STAT_CONFIG: 0,
	INT_STAT_CONFIG: 0,
	DEX_STAT_CONFIG: 0
}
@export var main_stat: StatConfig
