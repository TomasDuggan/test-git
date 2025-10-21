extends Object
class_name CharacterResistances

var _damage_resistances: Dictionary[DamageInfo.DamageType, float]
var _status_category_resistances: Dictionary[CharacterStatusEffects.StatusCategory, float]


func initialize() -> void:
	pass # TODO: llega config y carga los dict
