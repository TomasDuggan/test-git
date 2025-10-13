extends Node
class_name CharacterStateFactory


static func build_new_state(new_state: StateController.StateType) -> CharacterState:
	match new_state:
		StateController.StateType.IDLE:
			return IdleCharacterState.new()
		StateController.StateType.MOVE:
			return MoveCharacterState.new()
		StateController.StateType.PARRY:
			return ParryCharacterState.new()
		_:
			push_error("Should be unreachable!!!")
			return null
