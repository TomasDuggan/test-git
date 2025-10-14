extends CharacterState
class_name AttackCharacterState

var _is_attacking := true

func enter() -> void:
	character.stop_movement()
	character.animation.play_action(CharacterAnimation.Action.ATTACK)
	# TODO: character.attack.do_attack()
	character.animation.attack_finished.connect(_on_attack_animation_finished)

func _on_attack_animation_finished() -> void:
	_is_attacking = false
	request_state_change.emit(StateController.StateType.IDLE)

func process_frame(_delta: float) -> void:
	pass

func exit() -> void:
	pass

func can_exit_to(_state: StateController.StateType) -> bool:
	return !_is_attacking

func get_type() -> StateController.StateType:
	return StateController.StateType.ATTACK
