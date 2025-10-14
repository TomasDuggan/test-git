extends CharacterAttackTrigger
class_name HeroAttackTrigger


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("basic_attack"):
		trigger_state_change()
