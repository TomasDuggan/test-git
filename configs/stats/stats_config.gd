extends Resource
class_name StatsConfig

const STR_STAT_CONFIG: StatConfig = preload("uid://s52ip5rmkm8g")
const INT_STAT_CONFIG: StatConfig = preload("uid://pdqtg5p4bpst")
const DEX_STAT_CONFIG: StatConfig = preload("uid://g5su7bnt8cv")
const VIT_STAT_CONFIG: StatConfig = preload("uid://nd8pnhb3v0uy")
const WIS_STAT_CONFIG: StatConfig = preload("uid://cw6qt1818pml5")
const AWE_STAT_CONFIG: StatConfig = preload("uid://ceyv5bcovpv4y")


@export var all_stats: Dictionary[StatConfig, int] = {
	STR_STAT_CONFIG: 0,
	INT_STAT_CONFIG: 0,
	DEX_STAT_CONFIG: 0,
	VIT_STAT_CONFIG: 0,
	WIS_STAT_CONFIG: 0,
	AWE_STAT_CONFIG: 0,
}
