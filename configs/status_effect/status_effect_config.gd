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

func is_positive() -> bool:
	return get_category() == StatusCategory.POSITIVE
