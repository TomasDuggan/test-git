extends Node2D
class_name Character


@export var _config: CharacterConfig
@onready var selection_area = $SelectionArea


var _hp: int

func _ready():
	_hp = _config.hp

func start_turn() -> void:
	pass

func end_turn() -> void:
	pass

func get_skill_configs() -> Array[SkillConfig]:
	return _config.skill_configs







#
