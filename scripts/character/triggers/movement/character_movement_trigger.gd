@abstract
extends CharacterStateTrigger
class_name CharacterMovementTrigger

var _direction: Vector2


@abstract
func calculate_movement_direction() -> Vector2

func _process(_delta):
	var new_direction: Vector2 = calculate_movement_direction()
	
	#if _direction != new_direction: # TODO: llama cada frame
	_direction = new_direction
	trigger_state_change()

func trigger_state_change() -> void:
	if _direction == Vector2.ZERO:
		trigger_state.emit(StateController.StateType.IDLE)
	else:
		trigger_state.emit(StateController.StateType.MOVE)

func get_trigger_state() -> StateController.StateType:
	return StateController.StateType.MOVE

func get_movement_direction() -> Vector2:
	return _direction





#
