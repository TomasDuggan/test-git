@abstract
extends Resource
class_name SkillEffectConfig
"""
Lo que un skill gatilla al activarse
"""

@export var target_scope: SkillExecutionSystem.TargetScope
# TODO: podria agregar un campo 'apply_only_on_outcome': RollOutcomeType

@abstract
func get_effect_type() -> SkillEffectType

enum SkillEffectType {
	DAMAGE,
	HEAL,
	APPLY_STATUS_EFFECT,
}
