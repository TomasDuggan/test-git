extends Control
class_name SkillDrawbackUI

@export_category("Editor Dependencies")
@export var _desc: Label

signal selected(config: SkillEffectConfig)

var _config: SkillEffectConfig


func initialize(config: SkillEffectConfig) -> void:
	_config = config

func _ready():
	_desc.text = _config.get_description()

func _on_button_pressed():
	selected.emit(_config)
