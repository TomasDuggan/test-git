extends Control
class_name DrawbacksPicker

@export_category("Editor Dependencies")
@export var _drawbacks_container: Container

const SKILL_DRAWBACK_SCENE: PackedScene = preload("uid://bc682ii26r3kd")


func _ready():
	hide()
	CombatEventBus.skill_effect_drawbacks_triggered.connect(_on_drawbacks_triggered)

func _on_drawbacks_triggered(drawbacks: Array[SkillEffectConfig]) -> void:
	for c in _drawbacks_container.get_children():
		c.queue_free()
	
	_create_drawback_list(drawbacks)
	show()

func _create_drawback_list(drawbacks: Array[SkillEffectConfig]) -> void:
	for drawback: SkillEffectConfig in drawbacks:
		var instance: SkillDrawbackUI = SKILL_DRAWBACK_SCENE.instantiate()
		
		instance.initialize(drawback)
		instance.selected.connect(_on_drawback_selected, CONNECT_ONE_SHOT)
		_drawbacks_container.add_child(instance)

func _on_drawback_selected(config: SkillEffectConfig) -> void:
	hide()
	CombatEventBus.raise_event_skill_effect_drawback_selected(config)

func _exit_tree():
	CombatEventBus.skill_effect_drawbacks_triggered.disconnect(_on_drawbacks_triggered)




#
