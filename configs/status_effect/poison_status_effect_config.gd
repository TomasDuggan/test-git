extends StatusEffectConfig
class_name PoisonStatusEffectConfig

@export var damage_per_turn: int


func get_type() -> CharacterStatusEffects.StatusType:
	return CharacterStatusEffects.StatusType.POISON

func is_positive() -> bool:
	return false
