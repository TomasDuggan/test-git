extends Control
class_name SkillDescriptionModalUI


@export_category("Editor Dependencies")
@export var _content_container: Container
@export var _title: Label
@export var _desc: Label

var _config: SkillConfig

const MODAL_Y_OFFSET := 25.0


func initialize(config: SkillConfig) -> void:
	_config = config

func _ready():
	_title.text = _config.display_name
	_desc.text = _config.desc
	
	_resize()

# TODO: await get_tree().process_frame
func _resize() -> void:
	await get_tree().process_frame
	var content_size: float = _content_container.size.y
	
	size.y = content_size
	position.y -= content_size + MODAL_Y_OFFSET
	
	await get_tree().process_frame
	hide()
