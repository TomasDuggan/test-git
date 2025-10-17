extends SkillRecoilConfig
class_name LoseHPSkillRecoilConfig

@export var hp_amount: int


func get_recoil_type() -> SkillExecutionSystem.SkillRecoilType:
	return SkillExecutionSystem.SkillRecoilType.LOSE_HP
