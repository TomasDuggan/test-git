@abstract
extends Resource
class_name StatusEffectConfig


@export var turns_duration: int

@abstract
func get_type() -> CharacterStatusEffects.StatusType
