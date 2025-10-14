extends AnimatedSprite2D
class_name CharacterAnimation

signal attack_finished()

enum Action { IDLE, MOVE, ATTACK, PARRY }

const ACTION_TO_PREFIX: Dictionary[Action, String] = {
	Action.IDLE: IDLE_PREFIX,
	Action.MOVE: MOVE_PREFIX,
	Action.ATTACK: ATTACK_PREFIX,
	Action.PARRY: PARRY_PREFIX
}

const IDLE_PREFIX := "idle_"
const MOVE_PREFIX := "move_"
const ATTACK_PREFIX := "attack_"
const PARRY_PREFIX := "parry_"

const UP_SUFFIX := "up"
const DOWN_SUFFIX := "down"
const LEFT_SUFFIX := "left"

var _character: Character
var _last_direction: Vector2


func _ready():
	animation_finished.connect(_on_animation_finished)

func set_character(character: Character) -> void:
	_character = character

func play_action(action: Action) -> void:
	if action == Action.MOVE: # TODO, hace algo extra
		_play_move()
		return
	
	_play(ACTION_TO_PREFIX[action])

func _play_move() -> void:
	_last_direction = _character.get_current_direction()
	_play(MOVE_PREFIX)

func _play(prefix: String) -> void:
	play(prefix + _resolve_suffix(_last_direction))

func _on_animation_finished() -> void:
	if animation.begins_with(ATTACK_PREFIX):
		attack_finished.emit()

func _resolve_suffix(direction: Vector2) -> String:
	flip_h = direction.x > 0
	
	if abs(direction.x) >= abs(direction.y):
		return LEFT_SUFFIX
	else:
		return UP_SUFFIX if direction == Vector2.UP else DOWN_SUFFIX



#
