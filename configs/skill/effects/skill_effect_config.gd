@abstract
extends Resource
class_name SkillEffectConfig
"""
Lo que un skill gatilla al activarse
"""

@export_category("Logic")
@export var tone: SkillEffectTone
@export var target_scope: TargetScope

@abstract
func get_effect_type() -> SkillEffectType

@abstract
func get_description() -> String

func _get_target_scope_text() -> String:
	match target_scope:
		TargetScope.SELF:
			return "yourself"
		TargetScope.ALL_ALLIES:
			return "all allies"
		TargetScope.ALL_ENEMIES:
			return "all enemies"
		TargetScope.ALL_CHARACTERS:
			return "everyone"
		_:
			return "the target"

enum SkillEffectType {
	DAMAGE,
	HEAL,
	APPLY_STATUS_EFFECT,
}

enum TargetScope {
	CUSTOM_SELECTION, # Para poder seleccionar un target.
	SELF,
	ALL_ALLIES,
	ALL_ENEMIES,
	ALL_CHARACTERS,
}

enum SkillEffectTone {
	POSITIVE,
	NEUTRAL,
	NEGATIVE,
}
