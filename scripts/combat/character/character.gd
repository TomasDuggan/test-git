extends Control
class_name Character

@export var _config: CharacterConfig
@onready var _hp: CharacterHP = $HP

var _stats: CharacterStats


func _gui_input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			CombatEventBus.raise_event_character_selected(self)

func _ready():
	_hp.initialize(_config.hp, _config.armor, _config.magic_resistance)
	_stats = CharacterStats.new(_config.stats)

func start_turn() -> void:
	pass

func end_turn() -> void:
	pass

func get_skill_configs() -> Array[SkillConfig]:
	return _config.skill_configs

# Facade
func get_stats() -> CharacterStats:
	return _stats

# Facade
func get_hp() -> CharacterHP:
	return _hp

func is_hero() -> bool:
	return _config.is_hero

func is_ally_of(other: Character) -> bool:
	return self.is_hero() == other.is_hero()

func is_faster_than(speed: int) -> bool:
	return _config.speed > speed

func get_speed() -> int:
	return _config.speed




#
