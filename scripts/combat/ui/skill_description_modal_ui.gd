extends Control
class_name SkillDescriptionModalUI


@export_category("Editor Dependencies")
@export var _title: Label
@export var _desc: Label

var _config: SkillConfig

func initialize(config: SkillConfig) -> void:
	_config = config

func _ready():
	_title.text = _config.display_name
	_desc.text = _config.desc
