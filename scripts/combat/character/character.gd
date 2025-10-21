extends Control
class_name Character
"""
Centralizador y facade para hablar con un Character y sus componentes internos.
"""

@export var _config: CharacterConfig

@onready var _hp: CharacterHP = $HP

signal force_end_turn()

var _stats: CharacterStats
var _attributes: CharacterAttributes
var _resistances: CharacterResistances
var _status_effects: CharacterStatusEffects


func _gui_input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			CombatEventBus.raise_event_character_selected(self)

func _ready():
	_stats = CharacterStats.new(_config)
	_stats.stats_changed.connect(_on_stats_changed)
	
	_attributes = CharacterAttributes.new(_config.attributes, _stats)
	_resistances = CharacterResistances.new(_config.resistances, _stats)
	_hp.initialize(_config.hp)
	_status_effects = CharacterStatusEffects.new(self)

func start_turn() -> void:
	if !_status_effects.can_act():
		print_rich("[color='red']%s has a status that prevents him from acting![/color]" % _config.display_name)
		force_end_turn.emit()
	
	_status_effects.turn_started()

func end_turn() -> void:
	_status_effects.turn_ended()

func get_skill_configs() -> Array[SkillConfig]:
	return _config.skill_configs

func is_hero() -> bool:
	return _config.is_hero

func is_ally_of(other: Character) -> bool:
	return self.is_hero() == other.is_hero()

func is_faster_than(speed: int) -> bool:
	return _attributes.is_faster_than(speed)

func get_speed() -> int:
	return _attributes.get_speed()

func _on_stats_changed() -> void:
	_attributes.update_attributes_by_stats(_stats)
	_resistances.update_status_effect_resistances(_stats)

#region Actions
func do_damage(target: Character, damage_info: DamageInfo) -> int:
	_attributes.doing_damage(damage_info)
	_status_effects.doing_damage(damage_info)
	return target.receive_damage(damage_info)

func do_healing(target: Character, heal_amount: int) -> int:
	return target.receive_heal(heal_amount)

func do_apply_status_effect(target: Character, config: StatusEffectConfig, extra_stacks: int) -> void:
	target.receive_status_effect(config, extra_stacks)
#endregion

#region Reactions
func receive_damage(info: DamageInfo) -> int:
	_attributes.receiving_damage(info)
	_resistances.receiving_damage(info)
	_status_effects.receiving_damage(info)
	return _hp.receive_damage(info)

func receive_heal(heal_amount: int) -> int:
	return _hp.heal(heal_amount)

func receive_status_effect(config: StatusEffectConfig, extra_stacks: int) -> void:
	_status_effects.add_status_effect(config, extra_stacks)
#endregion

#region Stats Facade
func get_stat_points_by_type(stat_type: StatConfig.StatType) -> int:
	return _stats.get_stat_points_by_config(stat_type)

func get_roll_stat_modifier_value(stat_type: StatConfig.StatType) -> int:
	return _stats.get_roll_stat_modifier_value(stat_type)
#endregion




#
