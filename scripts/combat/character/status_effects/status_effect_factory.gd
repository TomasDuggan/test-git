extends Object
class_name StatusEffectFactory


static func new_status_effect(type: CharacterStatusEffects.StatusType) -> StatusEffect:
	match type:
		CharacterStatusEffects.StatusType.BLEED:
			return BleedStatusEffect.new()
		_:
			push_error("StatusEffectFactory. Status Effect type no encontrado: " + EnumsHelper.enum_to_string(CharacterStatusEffects.StatusType, type))
			return null
