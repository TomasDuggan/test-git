extends CharacterState
class_name ParryCharacterState


func enter() -> void:
	character.stop_movement()
	character.animation.play_action(CharacterAnimation.Action.PARRY)
	character.hp.set_parry(true)

func process_frame(_delta: float) -> void:
	pass

func exit() -> void:
	character.hp.set_parry(false)
	request_state_change.emit(StateController.StateType.IDLE)

func can_exit_to(_state: StateController.StateType) -> bool:
	return !character.triggers_handler.find_trigger(StateController.StateType.PARRY).is_parrying()

func get_type() -> StateController.StateType:
	return StateController.StateType.PARRY
