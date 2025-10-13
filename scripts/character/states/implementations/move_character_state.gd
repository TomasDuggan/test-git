extends CharacterState
class_name MoveCharacterState


func enter() -> void:
	pass

func process_frame(_delta: float) -> void:
	character.animation.play_move()
	character.move()

func exit() -> void:
	character.stop_movement()

func can_exit_to(_state: StateController.StateType) -> bool:
	return true

func get_type() -> StateController.StateType:
	return StateController.StateType.MOVE
