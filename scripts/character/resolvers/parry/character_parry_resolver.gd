@abstract
extends Node
class_name CharacterParryResolver

var state_controller: StateController
var is_doing_parry: bool # TODO: rename


func initialize(state_controller_arg: StateController) -> void:
	state_controller = state_controller_arg

func is_parrying() -> bool:
	return is_doing_parry
