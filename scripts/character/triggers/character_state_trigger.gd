@abstract
extends Node2D
class_name CharacterStateTrigger

@warning_ignore("unused_signal")
signal trigger_state(state: StateController.StateType)

@abstract
func trigger_state_change() -> void

@abstract
func get_trigger_state() -> StateController.StateType
