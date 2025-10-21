extends Object
class_name CharacterResistances
"""
Resistencias de dmg y de aplicacion de status effects de un Character.
Algunos stats escalan las resistencias a la aplicacion de status effects (agrupados por categoria).
"""

var _damage_resistances: Dictionary[DamageInfo.DamageType, float]
var _status_category_resistances: Dictionary[CharacterStatusEffects.StatusCategory, float]

const RESISTANCE_UPGRADE_BY_POINT := 0.02 # 2% por cada punto del stat
const RESISTANCE_UPGRADE_BY_STAT: Dictionary[StatConfig.StatType, CharacterStatusEffects.StatusCategory] = {
	StatConfig.StatType.VIT: CharacterStatusEffects.StatusCategory.CORROSIVE,
	StatConfig.StatType.WIS: CharacterStatusEffects.StatusCategory.ELEMENTAL,
	StatConfig.StatType.AWE: CharacterStatusEffects.StatusCategory.CONTROL,
}

func _init(config: CharacterResistancesConfig, stats: CharacterStats):
	_damage_resistances = config.damage_resistances
	_status_category_resistances = config.status_category_resistances

	update_status_effect_resistances(stats)

# TODO: Siempre suma... algun bug va a traer, revisar esta formula.
func update_status_effect_resistances(stats: CharacterStats) -> void:
	for upgrader_stat: StatConfig.StatType in RESISTANCE_UPGRADE_BY_STAT.keys():
		var category: CharacterStatusEffects.StatusCategory = RESISTANCE_UPGRADE_BY_STAT[upgrader_stat]
		var stat_points: int = stats.get_stat_points_by_type(upgrader_stat)
		var status_resistance_upgrade: float = stat_points * RESISTANCE_UPGRADE_BY_POINT
		
		_status_category_resistances[category] += status_resistance_upgrade

func reduce_damage(damage: int, damage_type: DamageInfo.DamageType) -> int:
	return damage - floor(damage * _damage_resistances.get(damage_type, 0.0))

# TODO: chequear esta formula
func can_apply_status(chance_to_apply: float, status_category: CharacterStatusEffects.StatusCategory) -> bool:
	var resistance: float = _status_category_resistances.get(status_category, 0.0)
	var final_chance: float = clamp(chance_to_apply * (1.0 - resistance), 0.0, 1.0)
	
	return randf() < final_chance



#
