extends StatusEffectConfig
class_name BleedStatusEffectConfig

@export var damage_per_turn: int


func get_type() -> CharacterStatusEffects.StatusType:
	return CharacterStatusEffects.StatusType.BLEED

func is_positive() -> bool:
	return false
