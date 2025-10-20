extends StatusEffectConfig
class_name DodgeStatusEffectConfig


func get_type() -> CharacterStatusEffects.StatusType:
	return CharacterStatusEffects.StatusType.DODGE

func is_positive() -> bool:
	return true
