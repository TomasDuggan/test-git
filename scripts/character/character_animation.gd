extends AnimatedSprite2D
class_name CharacterAnimation

var _character: Character
var _last_direction: Vector2

const IDLE_PREFIX := "idle_"
const MOVE_PREFIX := "move_"
const PARRY_PREFIX := "parry_"

const UP_SUFFIX := "up"
const DOWN_SUFFIX := "down"
const LEFT_SUFFIX := "left"


func set_character(character: Character) -> void:
	_character = character

func play_idle() -> void:
	_play(IDLE_PREFIX)

func play_move() -> void:
	_last_direction = _character.get_current_direction()
	_play(MOVE_PREFIX)

func play_parry() -> void:
	_play(PARRY_PREFIX)

func _play(prefix: String) -> void:
	play(prefix + _resolve_suffix(_last_direction))

func _resolve_suffix(direction: Vector2) -> String:
	flip_h = direction.x > 0
	
	if abs(direction.x) >= abs(direction.y):
		return LEFT_SUFFIX
	else:
		return UP_SUFFIX if direction == Vector2.UP else DOWN_SUFFIX



#
