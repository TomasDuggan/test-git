extends Object
class_name CharacterResistances
"""
Resistencias de dmg y de aplicacion de status effects de un Character.
Algunos stats escalan las resistencias a la aplicacion de status effects (agrupados por categoria).
"""

var _damage_resistances: Dictionary[DamageInfo.DamageType, float]
var _base_status_resistances: Dictionary[StatusEffectConfig.StatusCategory, float]
var _status_resistances: Dictionary[StatusEffectConfig.StatusCategory, float]

const MIN_RESISTANCE := 0.0
const MAX_RESISTANCE := 0.95
const RESISTANCE_UPGRADE_BY_POINT := 0.02 # 2% por cada punto del stat
const RESISTANCE_UPGRADE_BY_STAT: Dictionary[StatConfig.StatType, StatusEffectConfig.StatusCategory] = {
	StatConfig.StatType.VIT: StatusEffectConfig.StatusCategory.CORROSIVE,
	StatConfig.StatType.WIS: StatusEffectConfig.StatusCategory.ELEMENTAL,
	StatConfig.StatType.AWE: StatusEffectConfig.StatusCategory.CONTROL,
}

func _init(config: CharacterResistancesConfig, stats: CharacterStats):
	_damage_resistances = config.damage_resistances.duplicate()
	_status_resistances = config.status_category_resistances.duplicate()
	_base_status_resistances = _status_resistances.duplicate()
	update_status_effect_resistances(stats)

func update_status_effect_resistances(stats: CharacterStats) -> void:
	# Reiniciar al valor base antes de sumar
	for category: StatusEffectConfig.StatusCategory in _base_status_resistances.keys():
		_status_resistances[category] = _base_status_resistances[category]
	
	for upgrader_stat: StatConfig.StatType in RESISTANCE_UPGRADE_BY_STAT.keys():
		var category = RESISTANCE_UPGRADE_BY_STAT[upgrader_stat]
		var stat_points = stats.get_stat_points_by_type(upgrader_stat)
		var upgrade = stat_points * RESISTANCE_UPGRADE_BY_POINT
		
		_status_resistances[category] = clamp(
			upgrade, MIN_RESISTANCE, MAX_RESISTANCE
		)

func receiving_damage(damage_info: DamageInfo) -> void:
	if damage_info.is_piercing:
		return
	
	var base_damage: int = damage_info.damage
	var resistance: float = _damage_resistances.get(damage_info.damage_type, 0.0)
	
	damage_info.damage = base_damage - floor(base_damage * resistance)

# La propia aplicacion del Status Effect puede ser bloqueada por las resistencias
func can_receive_status_effect(config: StatusEffectConfig) -> bool:
	var chance_to_apply: float = config.chance_to_apply
	var resistance: float = _status_resistances.get(config.get_category(), 0.0)
	var final_chance: float

	if chance_to_apply <= 0.0:
		final_chance = 0.0
	elif resistance <= 0.0:
		final_chance = chance_to_apply
	else:
		final_chance = chance_to_apply / (chance_to_apply + resistance)

	return randf() < final_chance




#
