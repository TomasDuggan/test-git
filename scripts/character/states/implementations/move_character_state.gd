extends CharacterState
class_name MoveCharacterState


func enter() -> void:
	pass

func process_frame(_delta: float) -> void:
	character.animation.play_action(CharacterAnimation.Action.MOVE)
	character.move()

func exit() -> void:
	request_state_change.emit(StateController.StateType.IDLE)

func can_exit_to(_state: StateController.StateType) -> bool:
	return true

func get_type() -> StateController.StateType:
	return StateController.StateType.MOVE
