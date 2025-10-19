extends Object
class_name CharacterStatusEffects

enum StatusType { BLEED, POISON, STUN }

var _character: Character
var _applied_statuses: Array[StatusEffect] = []


func _init(character: Character) -> void:
	_character = character

func add_status_effect(config: StatusEffectConfig) -> void:
	var status: StatusEffect = _find_status_effect(config)
	
	if status == null:
		_create_status_effect(config)
	else:
		status.add_turns(config.turns_duration)

func _create_status_effect(config: StatusEffectConfig) -> void:
	var new_status: StatusEffect = StatusEffectFactory.new_status_effect(config.get_type())
	
	new_status.initialize(_character, config)
	new_status.effect_ended.connect(_remove_status_effect, CONNECT_ONE_SHOT)
	_applied_statuses.append(new_status)

func _remove_status_effect(config: StatusEffectConfig) -> void:
	_applied_statuses.erase(_find_status_effect(config))

func turn_started() -> void:
	for status: StatusEffect in _applied_statuses:
		status.turn_started()
	
func turn_ended() -> void:
	for status: StatusEffect in _applied_statuses:
		status.turn_ended()

func _find_status_effect(config: StatusEffectConfig) -> StatusEffect:
	var filtered_by_type: Array[StatusEffect] = _applied_statuses.filter(func(s: StatusEffect):
		return s.matches_config(config)
	)
	
	return null if filtered_by_type.is_empty() else filtered_by_type.front()







#
