extends Resource
class_name CharacterResistancesConfig


@export var damage_resistances: Dictionary[DamageInfo.DamageType, float] = {
	DamageInfo.DamageType.PHYSICAL: 0.1,
	DamageInfo.DamageType.MAGICAL: 0.1
} # Resistencia al DAMAGE del efecto
@export var status_category_resistances: Dictionary[StatusEffectConfig.StatusCategory, float] = {
	StatusEffectConfig.StatusCategory.POSITIVE: 0.0,
	StatusEffectConfig.StatusCategory.ELEMENTAL: 0.1,
	StatusEffectConfig.StatusCategory.CORROSIVE: 0.1,
	StatusEffectConfig.StatusCategory.CONTROL: 0.1
} # Resistencia a la APLICACION del status effect
