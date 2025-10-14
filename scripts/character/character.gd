extends CharacterBody2D
class_name Character


@export var _config: CharacterConfig

# Facades
@onready var animation: CharacterAnimation = $Animation
var hp := CharacterHP.new()
var triggers_handler := CharacterTriggersHandler.new()

var _movement_trigger: CharacterMovementTrigger
var _state_controller := StateController.new()


func _ready():
	animation.set_character(self)
	
	_state_controller.set_character(self)
	add_child(_state_controller)
	
	_initialize_triggers()
	
	hp.initialize(_config.hp) # TODO
	add_child(hp)

func _initialize_triggers() -> void:
	triggers_handler.initialize(_config.triggers)
	add_child(triggers_handler)
	
	triggers_handler.trigger_state_changed.connect(_on_trigger_state_change)
	_movement_trigger = triggers_handler.find_trigger(StateController.StateType.MOVE)

func _on_trigger_state_change(new_state: StateController.StateType) -> void:
	_state_controller.change_state_to(new_state)

func move() -> void:
	velocity = _movement_trigger.get_movement_direction() * _config.move_speed
	move_and_slide()

func stop_movement() -> void:
	velocity = Vector2.ZERO

func get_current_direction() -> Vector2:
	return _movement_trigger.get_movement_direction()






#
