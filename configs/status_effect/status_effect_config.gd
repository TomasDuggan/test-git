@abstract
extends Resource
class_name StatusEffectConfig

@export var stacks: int = 1


@abstract
func get_type() -> CharacterStatusEffects.StatusType

@abstract
func is_positive() -> bool
