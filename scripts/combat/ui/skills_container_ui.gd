extends HBoxContainer
class_name SkillsContainerUI

const SKILL_UI_SCENE: PackedScene = preload("uid://prlfdpqd0u28")


func _ready():
	CombatEventBus.turn_started.connect(_on_turn_started)
	
	_clean_skills()

func _clean_skills() -> void:
	for c in get_children():
		c.queue_free()

func _on_turn_started(character: Character) -> void:
	_clean_skills()
	_add_skills(character.get_skill_configs())

func _add_skills(skill_configs: Array[SkillConfig]) -> void:
	for skill_config: SkillConfig in skill_configs:
		var skill_ui_instance: SkillUI = SKILL_UI_SCENE.instantiate()
		skill_ui_instance.initialize(skill_config)
		add_child(skill_ui_instance)

func _exit_tree():
	CombatEventBus.turn_started.disconnect(_on_turn_started)






#
