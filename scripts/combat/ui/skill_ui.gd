extends Control
class_name SkillUI

@export_category("Editor Dependencies")
@export var _icon: TextureRect

var _config: SkillConfig


func initialize(config: SkillConfig) -> void:
	_config = config
	_icon.texture = _config.icon

func _on_activate_button_pressed():
	CombatEventBus.raise_event_skill_selected(_config)
