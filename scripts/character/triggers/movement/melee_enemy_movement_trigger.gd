extends CharacterMovementTrigger
class_name MeleeEnemyMovementTrigger


var _hero: Character

func _ready():
	_hero = get_tree().get_first_node_in_group("Hero")

func calculate_movement_direction() -> Vector2:
	return (_hero.global_position - global_position).normalized()
