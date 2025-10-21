extends StatusEffectConfig
class_name PoisonStatusEffectConfig

@export var damage_per_turn: int


func get_type() -> StatusType:
	return StatusType.POISON

func get_category() -> StatusCategory:
	return StatusCategory.CORROSIVE
