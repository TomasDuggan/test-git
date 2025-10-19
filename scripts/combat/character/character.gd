extends Control
class_name Character
"""
Centralizador, facade y API generica para hablar con un Character y sus componentes internos.
"""

@export var _config: CharacterConfig
@onready var _hp: CharacterHP = $HP

var _stats: CharacterStats
var _status_effect_manager: CharacterStatusEffects


func _gui_input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			CombatEventBus.raise_event_character_selected(self)

func _ready():
	_hp.initialize(_config.hp, _config.armor, _config.magic_resistance)
	_stats = CharacterStats.new(_config)
	_status_effect_manager = CharacterStatusEffects.new(self)

func start_turn() -> void:
	_status_effect_manager.turn_started()

func end_turn() -> void:
	_status_effect_manager.turn_ended()

func get_skill_configs() -> Array[SkillConfig]:
	return _config.skill_configs

func scale_effect_by_stat(base: Variant, effect_config: SkillEffectConfig) -> Variant:
	return _stats.scale_effect_by_stat(base, effect_config)

func get_roll_stat_modifier_value(stat_config: StatConfig) -> int:
	return _stats.get_roll_stat_modifier_value(stat_config)

func receive_damage(info: DamageInfo) -> int:
	return _hp.receive_damage(info)

func heal(heal_amount: int) -> int:
	return _hp.heal(heal_amount)

func add_status_effect(config: StatusEffectConfig) -> void:
	_status_effect_manager.add_status_effect(config)

func is_hero() -> bool:
	return _config.is_hero

func is_ally_of(other: Character) -> bool:
	return self.is_hero() == other.is_hero()

func is_faster_than(speed: int) -> bool:
	return _config.speed > speed

func get_speed() -> int:
	return _config.speed




#
