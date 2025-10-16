extends Node
"""
Bus para la escena de Combate
"""

signal combat_started(characters: Array[Character])
signal turn_started(character: Character)
signal character_selected(character: Character)
signal skill_selected(skill_config: SkillConfig)
signal roll_pressed()


func raise_event_combat_started(characters: Array[Character]) -> void:
	combat_started.emit(characters)

func raise_event_turn_started(character: Character) -> void:
	turn_started.emit(character)

func raise_event_character_selected(character: Character) -> void:
	character_selected.emit(character)

func raise_event_skill_selected(skill_config: SkillConfig) -> void:
	skill_selected.emit(skill_config)

func raise_event_roll_pressed() -> void:
	roll_pressed.emit()
