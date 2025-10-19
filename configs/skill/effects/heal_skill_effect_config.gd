extends SkillEffectConfig
class_name HealSkillEffectConfig
"""
Cura segun HealSource
- FLAT: Cura plana segun 'heal_amount'
- BY_DAMAGE_DONE: Cura estilo 'lifesteal' segun el dmg hecho por el skill * 'damage_multiplier'
"""

@export var source_type: HealSource
@export var heal_amount: int # FLAT
@export var damage_done_heal_multiplier: float # BY_DAMAGE_DONE

enum HealSource { FLAT, BY_DAMAGE_DONE }

func get_effect_type() -> SkillEffectType:
	return SkillEffectType.HEAL
