@abstract
extends Resource
class_name SkillRecoilConfig
"""
La repercusion de lanzar un skill
"""

@export var trigger_outcome: RollInterpreterSystem.RollOutcomeType

enum SkillRecoilType { LOSE_HP, }


@abstract
func get_recoil_type() -> SkillRecoilType
