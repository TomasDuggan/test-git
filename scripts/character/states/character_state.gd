@abstract
extends Node
class_name CharacterState

@warning_ignore("unused_signal")
signal request_state_change(new_state: StateController.StateType)

var character: Character


func set_character(character_arg: Character) -> void:
	character = character_arg

@abstract
func enter() -> void

@abstract
func process_frame(delta: float) -> void

@abstract
func exit() -> void

@abstract
func can_exit_to(state: StateController.StateType) -> bool

@abstract
func get_type() -> StateController.StateType
