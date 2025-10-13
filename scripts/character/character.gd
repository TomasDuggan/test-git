extends CharacterBody2D
class_name Character

# Facades
@onready var animation: CharacterAnimation = $Animation
var parry_resolver := HeroParryResolver.new() # TODO: inyectar

# Triggers
var _movement_resolver := HeroMovementResolver.new() # TODO: inyectar

var _state_controller := StateController.new()
var _speed := 100.0 # TODO: inyectar


func _ready():
	animation.set_character(self)
	
	_state_controller.set_character(self)
	add_child(_state_controller)
	
	_movement_resolver.initalize(_state_controller)
	add_child(_movement_resolver)
	
	parry_resolver.initialize(_state_controller)
	add_child(parry_resolver)

func move() -> void:
	velocity = _movement_resolver.get_movement_direction() * _speed
	move_and_slide()

func stop_movement() -> void:
	velocity = Vector2.ZERO

func get_current_direction() -> Vector2:
	return _movement_resolver.get_movement_direction()






#
