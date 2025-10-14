@abstract
extends CharacterStateTrigger
class_name CharacterAttackTrigger


func trigger_state_change() -> void:
	trigger_state.emit(get_trigger_state())

func get_trigger_state() -> StateController.StateType:
	return StateController.StateType.ATTACK
