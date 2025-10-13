extends CharacterParryResolver
class_name HeroParryResolver


func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("parry"):
		is_doing_parry = true
		state_controller.change_state_to(StateController.StateType.PARRY)
	if event.is_action_released("parry"):
		is_doing_parry = false
		state_controller.change_state_to(StateController.StateType.IDLE)
