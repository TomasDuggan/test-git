extends Node2D
class_name CharacterTriggersHandler

signal trigger_state_changed(new_state: StateController.StateType)

var _triggers: Array[CharacterStateTrigger] = []


func initialize(trigger_scripts: Array[Script]) -> void:
	_initialize_triggers(trigger_scripts)

func _initialize_triggers(trigger_scripts: Array[Script]) -> void:
	for trigger_script: Script in trigger_scripts:
		var trigger: CharacterStateTrigger = trigger_script.new()
		
		trigger.trigger_state.connect(_on_trigger_state_change)
		_triggers.append(trigger)
		add_child(trigger)

func _on_trigger_state_change(new_state: StateController.StateType) -> void:
	trigger_state_changed.emit(new_state)

func find_trigger(type: StateController.StateType) -> CharacterStateTrigger:
	for trigger: CharacterStateTrigger in _triggers:
		if trigger.get_trigger_state() == type:
			return trigger
	
	return null
