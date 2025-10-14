@abstract
extends CharacterStateTrigger
class_name CharacterParryTrigger

var is_doing_parry: bool # TODO: rename


func toggle_parry(parry_state: bool) -> void:
	is_doing_parry = parry_state
	
	trigger_state_change()

func trigger_state_change() -> void:
	if is_doing_parry:
		trigger_state.emit(StateController.StateType.PARRY)
	else:
		trigger_state.emit(StateController.StateType.IDLE)

func get_trigger_state() -> StateController.StateType:
	return StateController.StateType.PARRY

func is_parrying() -> bool:
	return is_doing_parry




#
