extends Object
class_name DamageInfo
"""
DTO para parametrizar un ataque.
Va mutando a lo largo del flujo, siendo alterado por atributos, resistencias, status effects, etc.
"""

enum DamageType { PHYSICAL, MAGICAL }

var source: Character
var damage: int
var damage_type: DamageType
var is_piercing: bool
var is_crit: bool
var is_evaded: bool


func _init(source_arg: Character, damage_arg: int, damage_type_arg: DamageType, is_piercing_arg: bool):
	source = source_arg
	damage = damage_arg
	damage_type = damage_type_arg
	is_piercing = is_piercing_arg
	is_crit = false
	is_evaded = false
