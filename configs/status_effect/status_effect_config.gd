@abstract
extends Resource
class_name StatusEffectConfig

@export var stacks: int = 1
@export_range(0, 1, 0.001) var chance_to_apply: float = 1.0


@abstract
func get_type() -> CharacterStatusEffects.StatusType

@abstract
func get_category() -> CharacterStatusEffects.StatusCategory

func is_positive() -> bool:
	return get_category() == CharacterStatusEffects.StatusCategory.POSITIVE
