extends Object
class_name CharacterAttributes
"""
Atributos del Character que afectan el combate
Algunos stats escalan atributos
"""

var _base_speed: int
var _base_physical_damage: int
var _base_magical_damage: int
var _base_crit_chance: float
var _base_crit_mult: float
var _base_evasion_chance: float

var _speed: int
var _physical_damage: int
var _magical_damage: int
var _crit_chance: float
var _crit_mult: float
var _evasion_chance: float


func _init(config: CharacterAttributesConfig, stats: CharacterStats):
	_base_speed = config.speed
	_base_physical_damage = config.physical_damage
	_base_magical_damage = config.magical_damage
	_base_crit_chance = config.crit_chance
	_base_crit_mult = config.crit_mult
	_base_evasion_chance = config.evasion_chance
	
	update_attributes_by_stats(stats)

func update_attributes_by_stats(stats: CharacterStats) -> void:
	# TODO: balancear todo esto
	_update_by_str(stats.get_stat_points_by_type(StatConfig.StatType.STR))
	_update_by_int(stats.get_stat_points_by_type(StatConfig.StatType.INT))
	_update_by_dex(stats.get_stat_points_by_type(StatConfig.StatType.DEX))

func _update_by_str(str_points: int) -> void:
	_physical_damage = _base_physical_damage + str_points

func _update_by_int(int_points: int) -> void:
	_magical_damage = _base_magical_damage + int_points

func _update_by_dex(dex_points: int) -> void:
	_speed = _base_speed + dex_points
	_crit_chance = _base_crit_chance + clamp(dex_points / 40.0, 0, 1) # Entre .25 y .45
	_crit_mult = _base_crit_mult + clamp(0, 0, 1) # TODO

func get_speed() -> int:
	return _speed

func is_faster_than(speed: int) -> bool:
	return _speed > speed

func doing_damage(damage_info: DamageInfo) -> void:
	var damage: int = _physical_damage if damage_info.damage_type == DamageInfo.DamageType.PHYSICAL else _magical_damage
	
	if _crit_chance > randf():
		damage = floor(damage * _crit_mult)
		damage_info.is_crit = true
	
	damage_info.damage += damage

func receiving_damage(damage_info: DamageInfo) -> void:
	if _evasion_chance > randf():
		damage_info.damage = 0
		damage_info.is_evaded = true
	



#
