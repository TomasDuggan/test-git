extends Object
class_name CharacterStatusEffects

enum StatusType { BLEED, POISON, STUN }

var _character: Character
var _applied_statuses_by_type: Dictionary[StatusType, StatusEffect] = {}


func _init(character: Character) -> void:
	_character = character

func add_status_effect(config: StatusEffectConfig) -> void:
	var status: StatusEffect = _applied_statuses_by_type.get(config.get_type(), null)
	
	if status == null:
		_create_status_effect(config)
	else:
		status.on_status_reapplied(config)

func get_stacks(config: StatusEffectConfig) -> int:
	var status: StatusEffect = _applied_statuses_by_type.get(config.get_type(), null)
	return 0 if status == null else status.get_stacks()

func _create_status_effect(config: StatusEffectConfig) -> void:
	var type: StatusType = config.get_type()
	var new_status: StatusEffect = StatusEffectFactory.new_status_effect(type)
	
	new_status.initialize(_character, config)
	new_status.effect_ended.connect(_remove_status_effect, CONNECT_ONE_SHOT)
	_applied_statuses_by_type[type] = new_status

func _remove_status_effect(config: StatusEffectConfig) -> void:
	_applied_statuses_by_type.erase(config.get_type())

func turn_started() -> void:
	for status: StatusEffect in _applied_statuses_by_type.values():
		status.on_turn_started()
	
func turn_ended() -> void:
	for status: StatusEffect in _applied_statuses_by_type.values():
		status.on_turn_ended()






#
