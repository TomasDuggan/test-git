@abstract
extends Resource
class_name SkillEffectConfig
"""
Lo que un skill gatilla al activarse
"""

@export var target_scope: TargetScope
@export var scaling_stat: StatConfig
@export var stat_scaling_multiplier: float = 1.0

@abstract
func get_effect_type() -> SkillEffectType

enum SkillEffectType {
	DAMAGE,
	HEAL,
}
enum TargetScope {
	CUSTOM_SELECTION, # Para poder seleccionar un target
	SELF,
	ALLIES,
	ENEMIES,
	ALL,
}
