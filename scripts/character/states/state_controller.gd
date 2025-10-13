extends Node
class_name StateController

enum StateType { IDLE, MOVE, PARRY, }

var _character: Character
var _current_state: CharacterState


func set_character(character: Character) -> void:
	_character = character

func _ready():
	_change_state(StateType.IDLE)

func _physics_process(delta: float):
	_current_state.process_frame(delta)

func _change_state(new_state: StateType) -> void:
	_current_state = CharacterStateFactory.build_new_state(new_state)
	_current_state.set_character(_character)
	_current_state.enter()

func change_state_to(new_state: StateType) -> void:
	if _current_state.get_type() == new_state:
		return
	
	if !_current_state.can_exit_to(new_state):
		return
	
	_current_state.exit()
	_change_state(new_state)







#
