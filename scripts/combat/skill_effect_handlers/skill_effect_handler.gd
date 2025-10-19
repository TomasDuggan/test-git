@abstract
extends Object
class_name SkillEffectHandler
"""
Maneja el efecto de un skill
"""

@abstract
func handle(config: SkillEffectConfig, targets: Array[Character], cast_context: SkillCastContext, execution_context: SkillExecutionContext) -> void

func scale_effect_by_stat(caster: Character, base_effect_power: Variant, config: SkillEffectConfig) -> Variant:
	return caster.get_stats().scale_effect_by_stat(base_effect_power, config)
#
