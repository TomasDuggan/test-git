extends Resource
class_name StatsConfig


@export var all_stats: Dictionary[StatConfig.StatType, int] = {
	StatConfig.StatType.STR: 0,
	StatConfig.StatType.INT: 0,
	StatConfig.StatType.DEX: 0,
	StatConfig.StatType.VIT: 0,
	StatConfig.StatType.WIS: 0,
	StatConfig.StatType.AWE: 0,
}
