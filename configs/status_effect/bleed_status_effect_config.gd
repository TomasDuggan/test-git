extends StatusEffectConfig
class_name BleedStatusEffectConfig

@export var damage_per_turn: int


func get_type() -> StatusType:
	return StatusType.BLEED

func get_category() -> StatusCategory:
	return StatusCategory.CORROSIVE
