@abstract
extends Resource
class_name SkillRecoilConfig


@export var trigger_outcome: RollInterpreterSystem.RollOutcomeType

@abstract
func get_recoil_type() -> SkillExecutionSystem.SkillRecoilType
