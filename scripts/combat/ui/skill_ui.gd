extends Control
class_name SkillUI

@export_category("Editor Dependencies")
@export var _icon: TextureRect
@export var _description_modal: SkillDescriptionModalUI

var _config: SkillConfig


func initialize(config: SkillConfig) -> void:
	_config = config
	_description_modal.initialize(_config)

func _ready():
	_icon.texture = _config.icon
	_description_modal.hide()

func _on_select_button_pressed():
	CombatEventBus.raise_event_skill_selected(_config)
	_description_modal.show()
