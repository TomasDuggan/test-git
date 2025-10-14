extends CharacterParryTrigger
class_name HeroParryTrigger


func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("parry"):
		super.toggle_parry(true)
	if event.is_action_released("parry"):
		super.toggle_parry(false)
