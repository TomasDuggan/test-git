extends Object
class_name CharacterAttributes
"""
Atributos del Character que afectan el combate
Algunos stats escalan atributos
"""

var _speed: int
var _physical_damage: int
var _magical_damage: int
var _crit_chance: float
var _crit_mult: float
var _evasion_chance: float


func _init(config: CharacterAttributesConfig, stats: CharacterStats):
	_speed = config.speed
	_physical_damage = config.physical_damage
	_magical_damage = config.magical_damage
	_crit_chance = config.crit_chance
	_crit_mult = config.crit_mult
	_evasion_chance = config.evasion_chance
	
	update_attributes_by_stats(stats)

func update_attributes_by_stats(stats: CharacterStats) -> void:
	# TODO: balancear todo esto
	_update_by_str(stats.get_stat_points_by_type(StatConfig.StatType.STR))
	_update_by_int(stats.get_stat_points_by_type(StatConfig.StatType.INT))
	_update_by_dex(stats.get_stat_points_by_type(StatConfig.StatType.DEX))

func _update_by_str(str_points: int) -> void:
	_physical_damage += str_points

func _update_by_int(int_points: int) -> void:
	_magical_damage += int_points

func _update_by_dex(dex_points: int) -> void:
	_speed += dex_points
	_crit_chance += dex_points / 40.0 # Entre .25 y .45
	_crit_mult += 0 # TODO

func get_speed() -> int:
	return _speed

func is_faster_than(speed: int) -> bool:
	return _speed > speed

func get_damage(damage_type: DamageInfo.DamageType) -> int:
	return _physical_damage if damage_type == DamageInfo.DamageType.PHYSICAL else _magical_damage

func get_crit_chance() -> float:
	return _crit_chance

func get_crit_mult() -> float:
	return _crit_mult

func get_evasion_chance() -> float:
	return _evasion_chance



#
