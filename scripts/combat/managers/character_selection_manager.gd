extends Node2D
class_name CharacterSelectionManager

var _space_state: PhysicsDirectSpaceState2D


func _ready():
	_space_state = get_world_2d().direct_space_state

func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("select_character"):
		_check_character_selection()

func _check_character_selection() -> void:
	var character: Character = _get_character_over_mouse()
	
	if character != null:
		CombatEventBus.raise_event_character_selected(character)

func _get_character_over_mouse() -> Character:
	var query_params = PhysicsPointQueryParameters2D.new()
	query_params.position = get_global_mouse_position()
	query_params.collide_with_areas = true
	query_params.collision_mask = 2 # TODO, es el SelectionArea2D de Character.tscn
	
	var results = _space_state.intersect_point(query_params)
	
	return null if results.is_empty() else results.front()["collider"].owner




#
