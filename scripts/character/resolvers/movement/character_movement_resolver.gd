@abstract
extends Node
class_name CharacterMovementResolver

var _direction: Vector2
var _state_controller: StateController


@abstract
func calculate_movement_direction() -> Vector2

func initalize(state_controller: StateController) -> void:
	_state_controller = state_controller

func _process(_delta):
	_direction = calculate_movement_direction()
	
	if _direction == Vector2.ZERO:
		_state_controller.change_state_to(StateController.StateType.IDLE)
	else:
		_state_controller.change_state_to(StateController.StateType.MOVE)


func get_movement_direction() -> Vector2:
	return _direction





#
