@abstract
extends Resource
class_name SkillEffectConfig

@export var scaling_stat: StatConfig
@export var stat_scaling_multiplier: float = 1.0
# TODO: aca se podrian agregar campos que multipliquen el resultado en los handlers segun FAIL, PARTIAL o SUCCESS

@abstract
func get_effect_type() -> SkillExecutionSystem.SkillEffectType
