extends Control
class_name Character


@export var _config: CharacterConfig
@onready var hp: CharacterHP = $HP # Facade



func _gui_input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			CombatEventBus.raise_event_character_selected(self)

func _ready():
	hp.initialize(_config.hp)

func start_turn() -> void:
	pass

func end_turn() -> void:
	pass

func get_skill_configs() -> Array[SkillConfig]:
	return _config.skill_configs







#
