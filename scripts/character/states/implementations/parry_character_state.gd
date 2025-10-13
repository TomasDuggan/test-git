extends CharacterState
class_name ParryCharacterState


func enter() -> void:
	character.stop_movement()
	character.animation.play_parry()

func process_frame(_delta: float) -> void:
	pass

func exit() -> void:
	pass

func can_exit_to(_state: StateController.StateType) -> bool:
	return !character.parry_resolver.is_parrying()

func get_type() -> StateController.StateType:
	return StateController.StateType.PARRY
