extends Button
class_name EndTurnButtonUI


func _on_pressed():
	CombatEventBus.raise_event_end_turn_pressed()
