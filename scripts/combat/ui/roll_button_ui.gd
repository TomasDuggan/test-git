extends Button
class_name RollButtonUI


func _on_pressed():
	CombatEventBus.raise_event_roll_pressed()
