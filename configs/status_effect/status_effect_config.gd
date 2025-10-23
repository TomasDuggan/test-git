@abstract
extends Resource
class_name StatusEffectConfig

@export var stacks: int = 1
@export_range(0, 1, 0.001) var chance_to_apply: float = 1.0

enum StatusType { BLEED, POISON, STUN, DODGE, }
enum StatusCategory { POSITIVE, ELEMENTAL, CORROSIVE, CONTROL }


@abstract
func get_type() -> StatusType

@abstract
func get_category() -> StatusCategory

func get_description() -> String:
	return "Apply %s stacks of %s" % [stacks, _get_type_as_text()]

func _get_type_as_text() -> String:
	match get_type():
		StatusType.BLEED:
			return "bleed"
		StatusType.POISON:
			return "poison"
		StatusType.STUN:
			return "stun"
		StatusType.DODGE:
			return "dodge"
		_:
			push_error(EnumsHelper.enum_to_string(StatusType, get_type()) + " no definido como texto!")
			return "undefined status effect"
		

func is_positive() -> bool:
	return get_category() == StatusCategory.POSITIVE
