extends Object
class_name StatusEffectFactory


static func new_status_effect(type: StatusEffectConfig.StatusType) -> StatusEffect:
	match type:
		StatusEffectConfig.StatusType.BLEED:
			return BleedStatusEffect.new()
		StatusEffectConfig.StatusType.POISON:
			return PoisonStatusEffect.new()
		StatusEffectConfig.StatusType.STUN:
			return StunStatusEffect.new()
		StatusEffectConfig.StatusType.DODGE:
			return DodgeStatusEffect.new()
		_:
			push_error("StatusEffectFactory. Status Effect type no encontrado: " + EnumsHelper.enum_to_string(StatusEffectConfig.StatusType, type))
			return null
