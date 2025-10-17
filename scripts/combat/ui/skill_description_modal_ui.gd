extends Control
class_name SkillDescriptionModalUI
"""
Modal para la descripcion de una Skill en combate
"""

@export_category("Editor Dependencies")
@export var _content_container: Container
@export var _title: Label
@export var _desc: Label

var _config: SkillConfig


func initialize(config: SkillConfig) -> void:
	_config = config

func _ready():
	_title.text = _config.display_name
	_desc.text = _config.desc
	
	_resize_based_on_content_size()

func _resize_based_on_content_size() -> void:
	await get_tree().process_frame
	var content_size: float = _content_container.size.y
	
	size.y = content_size
	position.y -= content_size

	hide()
