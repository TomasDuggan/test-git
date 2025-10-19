extends Object
class_name DamageInfo
"""
DTO para parametrizar un ataque
"""

var source: Character
var damage: int
var pierce_armor: bool
var pierce_mr: bool


func _init(source_arg: Character, damage_arg: int, pierce_armor_arg: bool, pierce_mr_arg: bool):
	source = source_arg
	damage = damage_arg
	pierce_armor = pierce_armor_arg
	pierce_mr = pierce_mr_arg
