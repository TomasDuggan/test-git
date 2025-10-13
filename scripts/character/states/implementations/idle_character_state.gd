extends CharacterState
class_name IdleCharacterState


func enter() -> void:
	character.stop_movement()
	character.animation.play_idle()

func process_frame(_delta: float) -> void:
	pass

func exit() -> void:
	pass

func can_exit_to(_state: StateController.StateType) -> bool:
	return true

func get_type() -> StateController.StateType:
	return StateController.StateType.IDLE
