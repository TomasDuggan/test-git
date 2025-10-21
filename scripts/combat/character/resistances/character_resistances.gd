extends Object
class_name CharacterResistances
"""
Resistencias de dmg y de aplicacion de status effects de un Character.
Algunos stats escalan las resistencias a la aplicacion de status effects (agrupados por categoria).
"""

var _damage_resistances: Dictionary[DamageInfo.DamageType, float]
var _base_status_resistances: Dictionary[CharacterStatusEffects.StatusCategory, float]
var _status_resistances: Dictionary[CharacterStatusEffects.StatusCategory, float]

const MIN_RESISTANCE := 0.0
const MAX_RESISTANCE := 0.95
const RESISTANCE_UPGRADE_BY_POINT := 0.02 # 2% por cada punto del stat
const RESISTANCE_UPGRADE_BY_STAT: Dictionary[StatConfig.StatType, CharacterStatusEffects.StatusCategory] = {
	StatConfig.StatType.VIT: CharacterStatusEffects.StatusCategory.CORROSIVE,
	StatConfig.StatType.WIS: CharacterStatusEffects.StatusCategory.ELEMENTAL,
	StatConfig.StatType.AWE: CharacterStatusEffects.StatusCategory.CONTROL,
}

func _init(config: CharacterResistancesConfig, stats: CharacterStats):
	_damage_resistances = config.damage_resistances.duplicate()
	_status_resistances = config.status_category_resistances.duplicate()
	_base_status_resistances = _status_resistances.duplicate()
	update_status_effect_resistances(stats)

func update_status_effect_resistances(stats: CharacterStats) -> void:
	# Reiniciar al valor base antes de sumar
	for category: CharacterStatusEffects.StatusCategory in _base_status_resistances.keys():
		_status_resistances[category] = _base_status_resistances[category]
	
	for upgrader_stat: StatConfig.StatType in RESISTANCE_UPGRADE_BY_STAT.keys():
		var category = RESISTANCE_UPGRADE_BY_STAT[upgrader_stat]
		var stat_points = stats.get_stat_points_by_type(upgrader_stat)
		var upgrade = stat_points * RESISTANCE_UPGRADE_BY_POINT
		
		_status_resistances[category] = clamp(
			upgrade, MIN_RESISTANCE, MAX_RESISTANCE
		)

func receiving_damage(damage_info: DamageInfo) -> void:
	var base_damage: int = damage_info.damage
	var resistance: float = _damage_resistances.get(damage_info.damage_type, 0.0)
	
	damage_info.damage = base_damage - floor(base_damage * resistance)

func can_apply_status(chance_to_apply: float, status_category: CharacterStatusEffects.StatusCategory) -> bool:
	var resistance: float = _status_resistances.get(status_category, 0.0)
	var final_chance: float

	if chance_to_apply <= 0.0:
		final_chance = 0.0
	elif resistance <= 0.0:
		final_chance = chance_to_apply
	else:
		final_chance = chance_to_apply / (chance_to_apply + resistance)

	return randf() < final_chance




#
