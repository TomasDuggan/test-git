@abstract
extends Resource
class_name StatusEffectConfig

@export var is_permanent: bool
@export var stacks: int = 1


@abstract
func get_type() -> CharacterStatusEffects.StatusType
